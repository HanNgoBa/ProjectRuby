$(document).ready(function() {
    $("#add-score-button").click(function() {
      var newFormGroup = $('<div>', {
        class: 'form-group',
      });
  
      newFormGroup.append(
        $('<input>', {
          type: 'text',
          name: 'score',
          style: 'width: 30%',
          class: 'form-control form-control-sm',
          placeholder: 'Score'
        }),
        $('<select>', {
          name: 'subject',
          style: 'width: 30%',
          class: 'form-select form-select-sm'
        }).append(
          $('<option>', {
            value: 'Select subject',
            text: 'Select subject'
          }),
          // Add your subject options here
        ),
        $('<select>', {
          name: 'semester',
          style: 'width: 30%',
          class: 'form-select form-select-sm'
        }).append(
          $('<option>', {
            value: 'Select semester',
            text: 'Select semester'
          }),
          // Add your semester options here
        )
      );
  
      newFormGroup.appendTo('#form-add-score');
    });
  });
  