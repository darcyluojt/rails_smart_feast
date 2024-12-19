import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = [ "gender", "height", "weight", "meals", "goal", "plan", "preview", "submit", "protein", "carbs", "calories" ]
  connect() {
    console.log(this.genderTarget)
  }

  preview(event) {
    event.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').content
    const profileData = {
      gender: this.genderTarget.value,
      height: this.heightTarget.value,
      weight: this.weightTarget.value,
      meals_per_day: this.mealsTarget.value,
      fitness_goal: this.goalTarget.value,
      meal_plan: this.planTarget.value
  }
    fetch('/profiles/preview', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': token
          },
          body: JSON.stringify({profile: profileData})
        })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          this.previewTarget.classList.toggle('d-none')
          this.submitTarget.classList.toggle('d-none')
          this.caloriesTarget.value = data.calories_per_day
          this.proteinTarget.value = data.protein_per_day
          this.carbsTarget.value = data.carbs_per_day
          // this.previewTarget.innerHTML = data.html
        })
        .catch(error => console.error('Error:', error))
  }
}
