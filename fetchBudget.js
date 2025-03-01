function fetchBudget() {
    fetch("fetch_budget.php")
    .then(response => response.json())
    .then(data => {
        let budgetDropdown = document.getElementById("college-budget");
        budgetDropdown.innerHTML = '<option value="">Select Budget</option>'; // Default option

        data.forEach(budget => {
            let option = document.createElement("option");
            option.value = budget.budget;
            option.textContent = budget.budget;
            budgetDropdown.appendChild(option);
        });
    })
    .catch(error => console.error("Error fetching student_budget:", error));
}


