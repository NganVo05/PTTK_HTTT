let url = "http://localhost:8080/api/staff/DSHD/" 
// const jsonstaff = JSON.parse(sessionStorage.getItem("jsonstaff"))
// if (jsonstaff === null) {
//     location.href = '/login/'
// }

//Lấy thông tin MAKH, TENKH
let MAKH=JSON.stringify(sessionStorage.getItem("MaKH"))
MAKH=MAKH.replace(/"/g,'')
console.log(MAKH)


let TENKH = JSON.stringify(sessionStorage.getItem("TenKH"))
console.log(TENKH)
TENKH = TENKH.replace(/"/g, '')



//Hiển thị các dòng thỏa điều kiện
async function display(){

    
    let addValueMKH=document.getElementById("content-mkh")
    addValueMKH.appendChild(document.createTextNode(MAKH))

    
    let addValueTKH = document.getElementById("content-tkh")
    addValueTKH.appendChild(document.createTextNode(TENKH))
   
    url_dvdk="http://localhost:8080/api/staff/DSDVDK/"
    url_dvdk=url_dvdk+MAKH

    url = url + MAKH
    console.log(url)
   
    //dịch vụ đăng ký
    const responseDVDK= await fetch(url_dvdk)
    const dataDVDK= await responseDVDK.json();

    //hóa đơn
    const response = await fetch(url)
    const json = await response.json();
    
    //tạo thêm 1 Query nếu mọi hóa đơn đều "ĐÃ THANH TOÁN" --> Không có hóa đơn nào cần thanh toán
    if (json.length === 0) {
        alert("Không có hóa đơn cần thanh toán")

        return
    }

    // console.log(data)

    var dataObjectDVDK=dataDVDK
    let keysDVDK=Object.keys(dataObjectDVDK[0])

    var dataObject=json
    let keys = Object.keys(dataObject[0])
    console.log(keys)
    if (keys[0] === "ERROR"){
        let data = JSON.stringify(dataObject[0].ERROR)
        alert(keys[0] + ' : ' + data)
    } else if (keysDVDK[0]==="ERROR")
    {
        let data = JSON.stringify(dataObdataObjectDVDKject[0].ERROR)
        alert(keysDVDK[0] + ' : ' + data)
    }
    else {
        createResponedDisplay(dataObject)
        createResponedDisplay(dataObjectDVDK)
    }  
}


//Hiển thị
function createResponedDisplay(data) {

    //Gắn giá trị vào Label MKH & TKH
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
        // let addValue=document.getElementById("content-mhd")
        // addValue.appendChild(document.createTextNode(menuItem[keys[0]]))
    
        // let addValueNL=document.getElementById("content-ngaylap")
        // addValueNL.appendChild(document.createTextNode(menuItem[keys[1]]))
    }

    let addValueTT=document.getElementById("content-TT")
    addValueTT.appendChild(document.createTextNode('100.000'))
   

}

display()
