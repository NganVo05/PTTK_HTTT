var url = "http://localhost:8080/api/detail-booked-room/";
var url_addSuite = "http://localhost:8080/api/add-suitecase-to-trans"
const maphong = localStorage.getItem('maphong')

if(maphong === null){
    location.href ='/DSDonDatPhong/index.html'
}
else{
    url = url + maphong
}

var header_text ={
    "MAPHONG": "Mã phòng",
    "MAKH": "Mã khách hàng",
    "NGAYLAP": "Thời gian đặt",
    "NGAYDEN": "Ngày check-in",
    "NGAYDI": "Ngày check-out"
}

var detail_text ={
    "TENKH": "Họ tên KH: ",
    "SDT": "Số điện thoại: ",
    "DIACHI": "Địa chỉ: ",
    "LOAIPHONG": "Loại phòng: ",
    "GIA": "Giá phòng: "
}


function returnMenu(data){
    
    const header_detail = document.getElementById("header-detail")
    //tên 5 trường đầu tiên của mục header
    var header_keys = Object.keys(data[0][0])
    //giá trị của 5 trường đó
    var header_value = data[0][0]
    for (let j = 0; j < header_keys.length; j++){
        const header_info = document.createElement("div")
        header_info.setAttribute("id", "header-info")  

        const title = document.createElement("p")
        title.appendChild(document.createTextNode(header_text[header_keys[j]]))
        
        const content = document.createElement('label')
        content.setAttribute("id", "content")
        content.appendChild(document.createTextNode(header_value[header_keys[j]]))
        
        header_info.appendChild(title)
        header_info.appendChild(content)
        
        header_detail.appendChild(header_info)
    }


    //show detail
    const column = document.getElementsByClassName('column')
    //tên 5 trường đầu tiên của mục header
    var detail_keys = Object.keys(data[1][0])
    // //giá trị của 5 trường đó
    var detail_value = data[1][0]

    //bắt đầu từ 3 trường đầu tiên của mảng dữ liệu thứ 2
    for (let j = 0; j < 3; j++){
        const detail_info = document.createElement("div")
        detail_info.setAttribute("class", "list-row")  

        const title = document.createElement("p")
        title.appendChild(document.createTextNode(detail_text[detail_keys[j]]))
        
        const content = document.createElement('label')
        content.setAttribute("id", "content")
        content.appendChild(document.createTextNode(detail_value[detail_keys[j]]))
        title.appendChild(content)
        detail_info.appendChild(title)
        
        column[0].appendChild(detail_info)
    }

    for (let j = 3; j < detail_keys.length; j++) {
        const detail_info = document.createElement("div")
        detail_info.setAttribute("class", "list-row")  

        const title = document.createElement("p")
        title.appendChild(document.createTextNode(detail_text[detail_keys[j]]))
        
        const content = document.createElement('label')
        content.setAttribute("id", "content")
        content.appendChild(document.createTextNode(detail_value[detail_keys[j]]))
        title.appendChild(content)
        detail_info.appendChild(title)
        
        column[1].appendChild(detail_info)
    }

    //Tạo button
    const detail_btn = document.createElement("div")
    detail_btn.setAttribute("class", "list-row") 
    const title = document.createElement("p")
    title.appendChild(document.createTextNode("Số lượng hành lý: "))

    const input = document.createElement("input")
    input.setAttribute("type", "number")
    title.appendChild(input)

    const btn_DangKy = document.createElement("button")
    btn_DangKy.click = getData()
    btn_DangKy.appendChild(document.createTextNode("Đăng ký"))


    title.appendChild(btn_DangKy)

    detail_btn.appendChild(title)    
    column[1].appendChild(detail_btn)
    
}

async function connectfetch(){
    
    const response = await fetch(url);
    const data = await response.json();
    if(Object.keys(data[0]) == 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
    }
    else{
        returnMenu(data)
    }
}
connectfetch()


