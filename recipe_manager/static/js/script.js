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
    newIngredientField.classList.add('form-group', 'mb-3','d-flex', 'align-items-center');
    
    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control ');
    input.setAttribute('name', 'ingredients');
    input.setAttribute('placeholder', 'Add another ingredient');
    input.style.flex = '1';

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x' );
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.style.marginLeft = '10px';
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
    newDirectionField.classList.add('form-group', 'mb-3', 'd-flex', 'align-items-center');

    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control');
    input.setAttribute('name', 'directions');
    input.setAttribute('placeholder', 'Add another step');
    input.style.flex = '1';

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x');
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.style.marginLeft = '10px';
    deleteIcon.addEventListener('click', function() {
        container.removeChild(newDirectionField);
    });

    newDirectionField.appendChild(input);
    newDirectionField.appendChild(deleteIcon);
    container.appendChild(newDirectionField);
});



document.getElementById('addTagBtn').addEventListener('click', function() {
    var container = document.getElementById('tagcontainer');
    console.log(container);
    var newTagField = document.createElement('div');
    newTagField.classList.add('form-group', 'mb-3', 'd-flex', 'align-items-center');

    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('class', 'form-control tag-input');
    input.setAttribute('name', 'tags');  // Ensure all tag inputs have the same name
    input.setAttribute('placeholder', 'Add another tag');
    input.style.flex = '1';

    var deleteIcon = document.createElement('i');
    deleteIcon.classList.add('ph', 'ph-x');
    deleteIcon.style.color = 'red';
    deleteIcon.style.cursor = 'pointer';
    deleteIcon.style.marginLeft = '10px';
    deleteIcon.addEventListener('click', function() {
        container.removeChild(newTagField);
    });

    newTagField.appendChild(input);
    newTagField.appendChild(deleteIcon);
    container.appendChild(newTagField);
});

// the above code doesnt adhere to DRY so we can code like this  (no working)

// function createInputField(container, placeholder) {
//     var newField = document.createElement('div');
//     newField.classList.add('form-group', 'mb-3', 'd-flex', 'align-items-center');

//     var input = document.createElement('input');
//     input.setAttribute('type', 'text');
//     input.setAttribute('class', 'form-control tag-input');
//     input.setAttribute('placeholder', placeholder);
//     input.name = 'tags'; // Set the name attribute if needed

//     var deleteIcon = document.createElement('i');
//     deleteIcon.classList.add('ph', 'ph-x');
//     deleteIcon.style.color = 'red';
//     deleteIcon.style.cursor = 'pointer';
//     deleteIcon.style.marginLeft = '10px';
//     deleteIcon.addEventListener('click', function() {
//         container.removeChild(newField);
//     });

//     newField.appendChild(input);
//     newField.appendChild(deleteIcon);
//     container.appendChild(newField);
// }


// // Event listeners using the createInputField function
// document.getElementById('addIngredientBtn').addEventListener('click', function() {
//     var container = document.getElementById('ingredientcontainer');
//     createInputField(container, 'Add another ingredient');
// });

// document.getElementById('addDirectionBtn').addEventListener('click', function() {
//     var container = document.getElementById('directioncontainer');
//     createInputField(container, 'Add another step');
// });

// document.getElementById('addTagBtn').addEventListener('click', function() {
//     var container = document.getElementById('tagcontainer');
//     createInputField(container, 'Add another tag');
// });


    



document.addEventListener('DOMContentLoaded', function () {
    const descriptionField = document.querySelector('textarea[name="description"]');
    const charCount = document.getElementById('charCount');
    const maxChars = 150;

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