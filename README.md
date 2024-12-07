# Flutter Developer Task

This Flutter application was developed as part of an evaluation task. The app adheres to the MVVM pattern, uses Riverpod for state management, and incorporates GoRouter for routing. Below are the details of the implemented features and instructions to set up and run the project.

---

## Features

### Screens and Functionalities
1. **Login Screen**
   - Fully functional UI with API integration.
   - Validates user input and checks login credentials using a mock API.

2. **Signup Screen**
   - User-friendly UI with API integration.
   - Validates form fields (name, email, password) and submits data to the mock API.

3. **OTP Verification Screen**
   - Intuitive OTP input UI with field auto-focus.
   - Verifies OTP using a mock API.

4. **Dashboard Screen**
   - Clean and responsive dashboard UI as per the provided Figma design.

### Other Key Features
- **State Management**: Implemented with Riverpod for efficient and clean state handling.
- **Routing**: Managed using GoRouter for dynamic and modular navigation.
- **Reusable Widgets**: Common UI components for consistent design and functionality.
- **Error Handling**: Robust validations for all user inputs and API responses.
- **UI Accuracy**: Screens designed precisely as per the Figma specifications.

---

## API Details

### Mock APIs Used
1. **Login API**
   - **Method**: `GET`
   - **Endpoint**: `https://jsonplaceholder.typicode.com/users?email={email}`
   - **Description**: Simulates login by verifying user email.

2. **Signup API**
   - **Method**: `POST`
   - **Endpoint**: `https://jsonplaceholder.typicode.com/users`
   - **Payload Example**:
     ```json
     {
       "name": "Jane Doe",
       "email": "jane.doe@example.com",
       "password": "password123"
     }
     ```

3. **OTP Verification API**
   - **Method**: `POST`
   - **Endpoint**: `https://jsonplaceholder.typicode.com/users`
   - **Additional Field**: Include `otp` in the payload for verification.



