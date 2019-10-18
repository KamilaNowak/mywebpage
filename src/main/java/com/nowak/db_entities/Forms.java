package com.nowak.db_entities;

import javax.persistence.*;

@Entity
@Table(name="forms")
public class Forms {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="username")
    private String username;

    @Column(name="email")
    private String email;

    @Column(name="having_comps")
    private String having_comps;

    @Column(name="max_cost")
    private long max_cost;

    @Column(name="additional_notes")
    private String additional_notes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHaving_comps() {
        return having_comps;
    }

    public void setHaving_comps(String having_comps) {
        this.having_comps = having_comps;
    }

    public long getMax_cost() {
        return max_cost;
    }

    public void setMax_cost(long max_cost) {
        this.max_cost = max_cost;
    }

    public String getAdditional_notes() {
        return additional_notes;
    }

    public void setAdditional_notes(String additional_notes) {
        this.additional_notes = additional_notes;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
