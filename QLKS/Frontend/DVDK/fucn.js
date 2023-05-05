let url = "http://localhost:8080/api/staff/DSDVDK/"
// const jsonstaff = JSON.parse(sessionStorage.getItem("jsonstaff"))
// if (jsonstaff === null) {
//     location.href = '/login/'
// }

//Lấy thông tin MAKH, TENKH
let MAKH = JSON.stringify(sessionStorage.getItem("MaKH"))
MAKH = MAKH.replace(/"/g, '')

console.log(MAKH)


let TENKH = JSON.stringify(sessionStorage.getItem("TenKH"))
console.log(TENKH)
TENKH = TENKH.replace(/"/g, '')
//const manv = jsonstaff.MANV
// console.log(jsonstaff)
// console.log(manv)


//Hiển thị các dòng thỏa điều kiện
async function display() {

    //Gắn giá trị vào Label MKH & TKH
    const addValue = document.getElementById("content-mkh")
    addValue.appendChild(document.createTextNode(MAKH))


    const addValueTKH = document.getElementById("content-tkh")
    addValueTKH.appendChild(document.createTextNode(TENKH))

    url = url + MAKH
    console.log(url)

    const response = await fetch(url)

    console.log(response)

    const json = await response.json();


    if (json.length === 0) {
        alert("Không Có Đăng Ký Dịch Vụ   ")

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


//Hiển thị
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

        for (let j = 0; j < 4; j++) {
            const content = document.createElement('label')
            content.setAttribute("id", "content")
            content.appendChild(document.createTextNode(menuItem[keys[j]]))
            divcard.appendChild(content)
        }
        divcontainer.appendChild(divcard)
    }
}

display()
