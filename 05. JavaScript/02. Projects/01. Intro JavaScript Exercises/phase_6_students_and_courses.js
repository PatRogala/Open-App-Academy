function Student(firstName, lastName, courses) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
}

Student.prototype.name = function() {
    return `${this.firstName} ${this.lastName}`;
}

Student.prototype.enroll = function(course) {
    if (!this.courses.includes(course)) {
        this.courses.push(course);
        course.addStudent(this);
    }
}

Student.prototype.courseLoad = function() {
    let courseLoad = {};
    this.courses.forEach(course => {
        if (!courseLoad[course.department]) {
            courseLoad[course.department] = course.credits;
        }
    });
    return courseLoad;
}

function Course(name, department, credits) {
    this.name = name;
    this.department = department;
    this.credits = credits;
    this.students = [];
}

Course.prototype.addStudent = function(student) {
    if (!this.students.includes(student)) {
        this.students.push(student);
        student.enroll(this);
    }
}
