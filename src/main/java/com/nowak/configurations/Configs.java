package com.nowak.configurations;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = "com.nowak")
@PropertySource("classpath:sql_starter.properties")
public class Configs {

    @Autowired
    private Environment environment;

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setPrefix("/WEB-INF/view/");
        internalResourceViewResolver.setSuffix(".jsp");
        return internalResourceViewResolver;
    }

    @Bean
    public DataSource comboDataSource() throws PropertyVetoException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();

        comboPooledDataSource.setDriverClass(environment.getProperty("jdbc.driver"));
        comboPooledDataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
        comboPooledDataSource.setUser(environment.getProperty("jdbc.username"));
        comboPooledDataSource.setPassword(environment.getProperty("jdbc.password"));

        comboPooledDataSource.setMinPoolSize(parseToInteger("connectionPool.minPoolSize"));
        comboPooledDataSource.setMaxPoolSize(parseToInteger("connectionPool.maxPoolSize"));
        comboPooledDataSource.setMaxIdleTime(parseToInteger("connectionPool.maxIdleTime"));
        comboPooledDataSource.setInitialPoolSize(parseToInteger("connectionPool.initialPoolSize"));
        return comboPooledDataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() throws PropertyVetoException {
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setHibernateProperties(getHibernateProperties());
        localSessionFactoryBean.setPackagesToScan(environment.getProperty("hibernate.packagesToScan"));
        localSessionFactoryBean.setDataSource(comboDataSource());
        return localSessionFactoryBean;
    }

    Properties getHibernateProperties() {
        Properties hbProperties = new Properties();
        hbProperties.setProperty("hibernate.dialect", environment.getProperty("hibernate.dialect"));
        hbProperties.setProperty("hibernate.show_sql", environment.getProperty("hibernate.show_sql"));
        hbProperties.setProperty("hibernate.default_schema", environment.getProperty("hibernate.default_schema"));
        hbProperties.setProperty("hibernate.packagesToScan", environment.getProperty("hibernate.packagesToScan"));
        return hbProperties;
    }

    @Autowired
    @Bean(name ="transactionManager")
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
        hibernateTransactionManager.setSessionFactory(sessionFactory);
        return hibernateTransactionManager;
    }

    public int parseToInteger(String property) {
        property = environment.getProperty(property);
        int value = Integer.parseInt(property);
        return value;
    }
}
