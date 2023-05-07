var url = "http://localhost:5080/api/detail-booked-room/";
var url_addSuite = "http://localhost:5080/api/add-suitecase-to-trans"
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

const toText= {
    "2": "Đảm bảo",
    "1": "Không đảm bảo"
  };

String.prototype.hashCodeForMA = function() {
    var hash = 0,
    i, chr;
  
    if (this.length === 0) return hash;
    for (i = 0; i < this.length; i++) {
      chr = this.charCodeAt(i);
      
      hash = ((hash << 5) - hash) + chr;
      hash |= 0; // Convert to 32bit integer
    }
    const hashStr = hash.toString();
    if(hashStr[0] === '-'){
      return hashStr.replace("-","")
    }
    return hashStr;
}


async function addSuitecase(makh,ngaylapks){
    var today = new Date()
    var ngaylap = today.toISOString();
    var str = makh + ngaylap
 
    var mapdk = 'PDK' + str.hashCodeForMA()

    console.log(mapdk)
    console.log(ngaylap)

    var soluong = document.getElementById('soluong')
    
    const jsonObject ={
        "MAPDK": mapdk,
        "MAKH": makh,
        "NGAYLAP": ngaylapks,
        "SOLUONG": soluong.value
    }
    const response = await fetch(url_addSuite, {
        method: "POST",
        body: JSON.stringify(jsonObject),
        headers: {
            "Content-Type": "application/json",
        },
    });
    console.log(response)
    const data = await response.json();
    
    if(Object.keys(data) == 'ERROR'){
        alert("ERROR: " + data.ERROR)
    }
    else{
        alert("Add Successfully!")
    }
    // location.href = "manage_restaurants.html"
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
    input.setAttribute("id","soluong")
    input.setAttribute("type", "number")
    title.appendChild(input)

    const btn_DangKy = document.createElement("button")
    // console.log(data[0][0].MAKH)
    // console.log(data[0][0].NGAYLAP)
    btn_DangKy.onclick = function(){
        addSuitecase(data[0][0].MAKH, data[0][0].NGAYLAP)
    }
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
        data[1][0].LOAIPHONG = toText[data[1][0].LOAIPHONG];
        // console.log(data[1][0].LOAIPHONG);
        returnMenu(data)
    }
}
connectfetch()

