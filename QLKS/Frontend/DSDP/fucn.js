let url = "http://localhost:5080/api/staff/DSPhong";
// const jsonstaff = JSON.parse(sessionStorage.getItem("jsonstaff"))
// if (jsonstaff === null) {
//     location.href = '/login/'
// }

function createResponedDisplay(data) {
    //EDIT LIST 
    const divcontainer = document.getElementById("list-row-container")

    for (let i = 0; i < data.length; i++) {
        //tạo thẻ div "DIVCARD"
        const divcard = document.createElement("div")

        //Thêm thuộc tính "ID thẻ là 'list-row'"
        divcard.setAttribute("id", "list-row")

        //độ dài object (?)
        const keys = Object.keys(data[i])

        const menuItem = data[i]
        const button = document.createElement('button')

        for (let j = 0; j < 5; j++) {
            const content = document.createElement('label')
            content.setAttribute("id", "content")
            content.appendChild(document.createTextNode(menuItem[keys[j]]))
            
            //document.getElementById("check-btn").value = menuItem[keys[j]];
            divcard.appendChild(content)
        }

        //tạo button
        button.setAttribute("id", menuItem[keys[1]])
        button.setAttribute("type", "submit")
        button.setAttribute("value", menuItem[keys[2]]) //gán MAKH vào Button
        button.setAttribute("onclick", "location.href = '/DVDK/index.html';createItem(this)")
        button.appendChild(document.createTextNode('Kiểm tra'))

        divcard.appendChild(button)

        divcontainer.appendChild(divcard)
    }
    //EDIT FOOTER
};

//lấy giá trị từ nút đã nhập
function createItem(objButton) {
    alert(  objButton.id+' ' +objButton.value);
    sessionStorage.MaKH=objButton.id;
    sessionStorage.TenKH=objButton.value;

    console.log(sessionStorage.MaKH);
}
  

async function TimKiemPhong() {
    //Xóa dữ liệu cũ, đổ dữ liệu mới vào 
    var div = document.getElementById('list-row-container');
    while(div.firstChild){
    div.removeChild(div.firstChild);
    }

    let url_search = "http://localhost:5080/api/staff/TimPhong/";
    let id = document.getElementById('search-content').value;
    console.log(id)
    url_search = url_search + id
    console.log(url_search)

    const response = await fetch(url_search)
    //return results of inserted parner 
    const json = await response.json();

    if (json.length === 0) {
        alert("Không Có Phòng Nào   ")
       
        return
    }
    console.log(json)

    var dataObject = json
    let keys = Object.keys(dataObject[0])
    console.log(keys)
    if (keys[0] === "ERROR") {
        let data = JSON.stringify(dataObject[0].ERROR)
        alert(keys[0] + ' : ' + data)
    }
    else {
        createResponedDisplay(dataObject)
    }
}



async function DisplayContract() {
    const response = await fetch(url)
    //return results of inserted parner 
    const json = await response.json();
    console.log(json)
    var dataObject = json
    //check error insert parner into db
    let keys = Object.keys(dataObject[0])
    console.log(keys)
    if (keys[0] === "ERROR") {
        let data = JSON.stringify(dataObject[0].ERROR)
        alert(keys[0] + ' : ' + data)
    }
    else {
        createResponedDisplay(dataObject)
    }
};



DisplayContract()