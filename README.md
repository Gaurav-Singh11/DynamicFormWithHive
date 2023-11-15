Use Hive/SQLite as a local db
1. Students List Screen:
- Displays a list of student cards with the following details: name, email, gender.
- Provides options for editing and deleting each student.
- Includes a floating action button with an add icon, which opens the "Add Students" screen when tapped.
- The "Edit" option opens the "Edit Student" screen to update student information.
- The "Delete" option opens a delete confirmation popup with "Yes" and "No" options. 
- If the user selects "Yes", the student is deleted from local db.

2. Add Students Screen:
- Initially displays a form with fields for email, name, and gender for adding a new student.
- Includes a floating action button with a "+" icon. Tapping this button dynamically 
- adds more forms (up to 5) for adding additional students.
- Provides a "Save" button that, when tapped, saves the entered information in local db, 
- closes the screen, and refreshes the "Students List" screen with the updated student list.

3. Edit Student Screen:
- Displays fields for editing a student's name, email, and gender.
- Provides a "Save" button with pre-filled data that allows the user to update 
- the student's information in local db.