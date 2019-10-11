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
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import javax.xml.ws.Action;
import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@EnableWebMvc
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
    DataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();

        comboPooledDataSource.setDriverClass(environment.getProperty("jdbc.driver"));
        comboPooledDataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
        comboPooledDataSource.setUser(environment.getProperty("jdbc.username"));
        comboPooledDataSource.setPassword(environment.getProperty("jdbc.password"));

        comboPooledDataSource.setMinPoolSize(parseToInteger(environment.getProperty("connectionPool.minPoolSize")));
        comboPooledDataSource.setMaxPoolSize(parseToInteger(environment.getProperty("connectionPool.maxPoolSize")));
        comboPooledDataSource.setMaxIdleTime(parseToInteger(environment.getProperty("connectionPool.maxIdleTime")));
        comboPooledDataSource.setInitialPoolSize(parseToInteger(environment.getProperty("connectionPool.initialPoolSize")));
        return comboPooledDataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory(){
        LocalSessionFactoryBean localSessionFactoryBean=new LocalSessionFactoryBean();
        localSessionFactoryBean.setHibernateProperties(getHibernateProperties());
        localSessionFactoryBean.setPackagesToScan(environment.getProperty("hibernate.packagesToScan"));
        try {
            localSessionFactoryBean.setDataSource(dataSource());
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        return localSessionFactoryBean;
    }
    Properties getHibernateProperties(){
        Properties hbProperties = new Properties();
        hbProperties.setProperty("hibernate.dialect",environment.getProperty("hibernate.dialect"));
        hbProperties.setProperty("hibernate.show_sql",environment.getProperty("hibernate.show_sql"));
        hbProperties.setProperty("hibernate.default_schema",environment.getProperty("hibernate.default_schema"));
        hbProperties.setProperty("hibernate.packagesToScan",environment.getProperty("hibernate.packagesToScan"));
        return hbProperties;
    }
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory){
        HibernateTransactionManager hibernateTransactionManager = new HibernateTransactionManager();
        hibernateTransactionManager.setSessionFactory(sessionFactory);
        return hibernateTransactionManager;
    }
    public int parseToInteger(String property){
        property=environment.getProperty(property);
        int value= Integer.parseInt(property);
        return value;
    }
}
