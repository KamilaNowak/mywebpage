package com.nowak.validation;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ValidationUser {

    private int id;

    @NotNull(message = "Wypełnij pole nazwy!")
    @Size(min=2,message = "Wymagane co najmniej 2 znaki!")
    private String username;

    @NotNull(message = "Wypełnij pole hasła!")
    @Size(min=3,message ="Wymagane co najmniej 2 znaki")
    private String password;

    @NotNull(message = "Wypełnij pole potwierdzenia!")
    @Size(min=3,message ="Wymagane co najmniej 2 znaki")
    private String confirmPassword;

    @NotNull(message = "Wypełnij pole email!")
    private String email;

    private long phone;

    private String birthDate;

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
