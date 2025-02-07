document.addEventListener("DOMContentLoaded", function () {
    const filterButtons = document.querySelectorAll(".filter-button");
    const resetButton = document.getElementById("reset-filters");
    const resultsContainer = document.getElementById("results");
    let filters = {};

    filterButtons.forEach(button => {
        button.addEventListener("click", function () {
            const filterType = this.dataset.filterType;
            const filterValue = this.dataset.filterValue;
            
            if (filters[filterType] === filterValue) {
                delete filters[filterType];
                this.classList.remove("selected");
            } else {
                filters[filterType] = filterValue;
                this.classList.add("selected");
            }
            fetchFilteredColleges();
        });
    });

    resetButton.addEventListener("click", function () {
        filters = {};
        filterButtons.forEach(button => button.classList.remove("selected"));
        fetchFilteredColleges();
    });

    function fetchFilteredColleges() {
        let queryString = Object.keys(filters).map(key => `${key}=${encodeURIComponent(filters[key])}`).join("&");
        
        fetch(`fetch_colleges.php?${queryString}`)
            .then(response => response.json())
            .then(data => {
                resultsContainer.innerHTML = "";
                if (data.length === 0) {
                    resultsContainer.innerHTML = "<p>No colleges found matching your criteria.</p>";
                }
                data.forEach(college => {
                    let collegeCard = document.createElement("div");
                    collegeCard.classList.add("college-card");
                    collegeCard.innerHTML = `
                        <h3>${college.name}</h3>
                        <p><strong>Location:</strong> ${college.location}</p>
                        <p><strong>Budget:</strong> ${college.budget}</p>
                        <p><strong>Courses:</strong> ${college.courses}</p>
                        <p><strong>Placement:</strong> ${college.placement}</p>
                        <p><strong>Specialization:</strong> ${college.specialization}</p>
                        <p><strong>Ranking:</strong> ${college.ranking}</p>
                        <p><strong>Facilities:</strong> ${college.facilities}</p>
                        <p><strong>USP:</strong> ${college.usp}</p>
                        <button class="bookmark-button" data-id="${college.id}">Bookmark</button>
                    `;
                    resultsContainer.appendChild(collegeCard);
                });
                attachBookmarkEvents();
            });
    }

    function attachBookmarkEvents() {
        document.querySelectorAll(".bookmark-button").forEach(button => {
            button.addEventListener("click", function () {
                let collegeId = this.dataset.id;
                fetch("manage_bookmarks.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: `college_id=${collegeId}`
                })
                .then(response => response.json())
                .then(data => alert(data.message));
            });
        });
    }

    fetchFilteredColleges();
});

