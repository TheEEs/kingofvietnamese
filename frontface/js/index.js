var hint = "";
function refresh(){
    axios.get("/word").then(response => {
        const text = response.data[1]
        const tw = new Typewriter('div#quest', {
            loop: false
        });
        tw.typeString(text)
        .start();
        hint = response.data[0];
    })
}
document.addEventListener("DOMContentLoaded", function(){
    refresh();
    const answer = document.querySelector("div#answer");
    document.querySelector("button#next").addEventListener("click", refresh);
    document.querySelector("button#hint").addEventListener('click', function(event) { 
        swal({
            title: hint
        })
    });
});
