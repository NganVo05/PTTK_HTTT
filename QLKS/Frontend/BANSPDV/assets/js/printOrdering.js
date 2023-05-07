let MAPDK = localStorage.getItem('printOrderingID')
let STT = localStorage.getItem('printOrderingNum')
let BASE_URL = readTextFile("../assets/data_local.txt")
let url_getinfo = BASE_URL + '/api/getinfooneticket'

async function displayInfo(){
    let dataRep = {
        mapdk : MAPDK,
        stt: STT
    }
    await fetch(url_getinfo, {
        method: "POST",
        body: JSON.stringify(dataRep),
        headers: {
            "Content-Type": "application/json",
        },
    }).then((response) =>{
        return response.json()
    }).then((data) =>{
        if(data.length === 0){
            alert("Không có hoá đơn nào được tạo")
            window.close()
            return 
        }
        document.getElementById('billCode').value = data[0].MAPDK
        document.getElementById('cusCode').value = data[0].MAKH
        document.getElementById('type').value = data[0].LOAIDV_SP
        document.getElementById('price').value = (data[0].THANHTIEN / data[0].SOLUONG).toFixed(0)
        document.getElementById('startTime').value = data[0].GIOBD
        document.getElementById('endTime').value = data[0].GIOKT
        document.getElementById('quantity').value = data[0].SOLUONG
        document.getElementById('note').value = data[0].GHICHU
        document.getElementById('totalPrice').value = data[0].THANHTIEN
        document.getElementById('statusPaying').value = data[0].TINHTRANG
    }).then(()=>{
        window.print()
    })
}

displayInfo()