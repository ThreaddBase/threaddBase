package com.model;

public class UserModel {

    private String username;
    private String firstName;
    private String lastName;
    private String bio;
    private String dob;
    private String email;
    private String password;
    private String profileImage;
    private String role;

    // ─── Constructors ───────────────────────────────────────────

    public UserModel() {}

    public UserModel(String username, String firstName, String lastName,
                     String bio, String dob, String email,
                     String password, String profileImage, String role) {
        this.username     = username;
        this.firstName    = firstName;
        this.lastName     = lastName;
        this.bio          = bio;
        this.dob          = dob;
        this.email        = email;
        this.password     = password;
        this.profileImage = profileImage;
        this.role         = role;
    }

    // ─── Getters & Setters ──────────────────────────────────────

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // ─── toString (useful for debugging) ────────────────────────

    @Override
    public String toString() {
        return "UserModel{" +
                "username='" + username + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", bio='" + bio + '\'' +
                ", dob='" + dob + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", profileImage='" + profileImage + '\'' +
                '}';
    }
}