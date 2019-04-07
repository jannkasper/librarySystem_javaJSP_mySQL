package database;

public class student {
    private Integer admissionNo;
    private String name;
    private Integer grade;
    private String section;
    private String description;
    private boolean active;

    public student(Integer admissionNo, String name, Integer grade, String section, String description, boolean active) {
        this.admissionNo = admissionNo;
        this.name = name;
        this.grade = grade;
        this.section = section;
        this.description = description;
        this.active = active;
    }


    public Integer getAdmissionNo() {
        return admissionNo;
    }

    public void setAdmissionNo(Integer admissionNo) {
        this.admissionNo = admissionNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "student{" +
                "admissionNo=" + admissionNo +
                ", name='" + name + '\'' +
                ", grade=" + grade +
                ", section='" + section + '\'' +
                ", description='" + description + '\'' +
                ", active=" + active +
                '}';
    }
}
