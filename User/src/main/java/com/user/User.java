package com.user;

public class User {
    private int id;
    private String username;
    private String email;
    private String password;

    // Patient Details
    private String patientName;
    private String patientAge;
    private String patientGender;
    private String patientCondition;

    // Guardian Details
    private String guardianName;
    private String guardianContact;
    private String guardianRelation;

    public User(int id, String username, String email, String password, String patientName, String patientAge,
                String patientGender, String patientCondition, String guardianName, String guardianContact, String guardianRelation) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.patientName = patientName;
        this.patientAge = patientAge;
        this.patientGender = patientGender;
        this.patientCondition = patientCondition;
        this.guardianName = guardianName;
        this.guardianContact = guardianContact;
        this.guardianRelation = guardianRelation;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPatientName() {
        return patientName;
    }

    public String getPatientAge() {
        return patientAge;
    }

    public String getPatientGender() {
        return patientGender;
    }

    public String getPatientCondition() {
        return patientCondition;
    }

    public String getGuardianName() {
        return guardianName;
    }

    public String getGuardianContact() {
        return guardianContact;
    }

    public String getGuardianRelation() {
        return guardianRelation;
    }
}
