move = document.getElementsByClassName('.move_action')
search = window.location.search
move.forEach(element => {
    element.addEventListener("click", function(e){
        $.ajax({
            type: PUT,
            url: 'http://localhost:3000/manager/students/'+{search},
            data:{
                
            },
            success: function(data){
                refreshStudentList(data);
            }
            
        })
    })
});
console.log("1321421")