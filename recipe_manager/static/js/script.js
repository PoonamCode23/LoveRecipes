// function showFile(event) {
//     var input = event.target;
//     var reader = new FileReader();
//     reader.onload = function() {
//         var dataURL = reader.result;
//         var output = document.getElementById('file-preview');
//         output.src = dataURL;
//     };
//     reader.readAsDataURL(input.files[0]);
// }
function showFile(event) {
    var input = event.target;
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function() {
        var dataURL = reader.result;
        var output = document.getElementById('file-preview');
        output.src = dataURL;
        output.style.display = 'block'; // Show the image preview
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  document.getElementById('addIngredientBtn').addEventListener('click', function() {
    var container = document.getElementById('ingredientcontainer');
    var newIngredientField = document.createElement('div');
    newIngredientField.classList.add('form-group', 'mb-3');
    
    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control');
    input.setAttribute('name', 'ingredients');
    input.setAttribute('placeholder', 'Add another ingredient');

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x');
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.addEventListener('click', function() {
        container.removeChild(newIngredientField);
    });
    newIngredientField.appendChild(input);
    newIngredientField.appendChild(deleteIcon);
    container.appendChild(newIngredientField);
});

document.getElementById('addDirectionBtn').addEventListener('click', function() {
    var container = document.getElementById('directioncontainer');
    var newDirectionField = document.createElement('div');
    newDirectionField.classList.add('form-group', 'mb-3');
    
    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control');
    input.setAttribute('name', 'directions');
    input.setAttribute('placeholder', 'Add another step');

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x');
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.addEventListener('click', function() {
        container.removeChild(newDirectionField);
    });
    newDirectionField.appendChild(input);
    newDirectionField.appendChild(deleteIcon);
    container.appendChild(newDirectionField);
});


document.getElementById('addTagBtn').addEventListener('click', function() {
    var container = document.getElementById('tagcontainer');
    var newTagField = document.createElement('div');
    newTagField.classList.add('form-group', 'mb-3');

    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control tag-input');
    input.setAttribute('name', 'tags');  // Ensure all tag inputs have the same name
    input.setAttribute('placeholder', 'Add another tag');

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x');
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.addEventListener('click', function() {
        container.removeChild(newTagField);
    });

    newTagField.appendChild(input);
    newTagField.appendChild(deleteIcon);
    container.appendChild(newTagField);
});


document.addEventListener('DOMContentLoaded', function () {
    const descriptionField = document.querySelector('textarea[name="description"]');
    const charCount = document.getElementById('charCount');
    const maxChars = 130;

    function updateCharCount() {
        const remaining = maxChars - descriptionField.value.length;
        charCount.textContent = `${remaining} characters remaining.`;
    }

    descriptionField.addEventListener('input', updateCharCount);
    updateCharCount();  
});

function resetForm() {
    document.querySelector('form').reset();
    document.getElementById('file-preview').src = 'https://placehold.co/200x200';
}
