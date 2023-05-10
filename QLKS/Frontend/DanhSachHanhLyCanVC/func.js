const url = "http://localhost:5080/api/suitcase-list-for-bellman/:id";
const url_update = "http://localhost:5080/api/update-suitcase-for-bellman"
// const jsonstaff = JSON.parse(sessionStorage.getItem("jsonstaff"))
// if(jsonstaff === null){
//     location.href = '/login/'
// }

async function updateTinhTrangHanhLy(mapdk){
    const newjsonObject = {
        "MAPDK": mapdk
    }
    const response = await fetch(url_update, {
    method: "POST",
    body: JSON.stringify(newjsonObject),
    headers: {
        "Content-Type": "application/json",
    },
    });
}

function createResponedDisplay(data){
    //EDIT LIST 
    const divcontainer = document.getElementById("list-row-container")
 
    for(let i = 0; i < data.length; i++){
        
        const divcard = document.createElement("div")
        divcard.setAttribute("id", "list-row")
        const keys = Object.keys(data[i])
        const menuItem = data[i]
        //console.log('đây',data[i].MAPDK)
        //console.log(menuItem[keys[keys.length-1]])
        //keys.length - 1 để không in trường mã phiếu đăng ký hành lý
        for (let j = 0; j < keys.length - 1; j++) {
            const content = document.createElement('label')
            content.setAttribute("id", "content")
            content.appendChild(document.createTextNode(menuItem[keys[j]]))
            divcard.appendChild(content)
        }
        //tạo button
        const button = document.createElement('button') 
        button.setAttribute("id", "btn-detail")
        const button_p = document.createElement('p') 
        button_p.appendChild(document.createTextNode('CHỜ VẬN CHUYỂN'))
        button.onclick = async function(){ 
            await updateTinhTrangHanhLy(data[i].MAPDK)
            window.location.reload()
        }
        button.appendChild(button_p)
        divcard.appendChild(button)
        divcontainer.appendChild(divcard)
    }
}



async function DisplaySuitcaseList(){
    const response = await fetch(url)

    //return results of inserted parner 
    const json = await response.json();
    //console.log('TOI LA JSON',json)
    var dataObject = json
    //check error insert parner into db
    let keys = Object.keys(dataObject[0])
    //console.log('TOI LA KEYS', keys)
    if (keys[0] === "ERROR"){
        let data = JSON.stringify(dataObject[0].ERROR)
        alert(keys[0] + ' : ' + data)
    }
    else {
        createResponedDisplay(dataObject)
    }
}

DisplaySuitcaseList()