package com.nowak.validation;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ValidationPassword {

    @NotNull(message = "Podaj stare hasło!")
    @Size(min=3, message = "Wymagane minimum 3 znaki")
    private String oldPassword;

    @NotNull(message = "Podaj nowe hasło!")
    @Size(min=3, message = "Wymagane minimum 3 znaki")
    private String newPassword;

    @NotNull(message = "Potwierdź nowe hasło!")
    @Size(min=3, message = "Wymagane minimum 3 znaki")
    private String confirmPassword;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
