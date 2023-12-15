// Sample user data for demonstration purposes
const currentUser = {
    username: "john_doe",
    userType: "customer", // or "seller"
};

// Function to set the username in the user info section
function setUserInfo() {
    const usernameDisplay = document.getElementById("username-display");
    usernameDisplay.textContent = `Welcome, ${currentUser.username} (${currentUser.userType})`;
}

// Function to handle logout
function logout() {
    // Perform logout actions, e.g., clear session, redirect to login page, etc.
    alert("Logout successful!"); // Replace with actual logout logic
}

// Function to handle page change
function changePage() {
    const selectedPage = document.getElementById("pages").value;
    // Add logic to handle page change, e.g., load content for the selected page
    alert(`Navigating to ${selectedPage} page...`); // Replace with actual page navigation logic
}

// Call the setUserInfo function to display the current user's information
setUserInfo();
