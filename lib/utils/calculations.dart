
int calculateAge(DateTime birthdate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;

    if (currentDate.month < birthdate.month ||
        (currentDate.month == birthdate.month && currentDate.day < birthdate.day)) {
      age--;
    }

    return age;
}