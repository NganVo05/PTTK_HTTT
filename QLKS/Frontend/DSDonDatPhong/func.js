const url = "http://localhost:5080/api/book-room-list/:id";
// const jsonstaff = JSON.parse(sessionStorage.getItem("jsonstaff"))
// if(jsonstaff === null){
//     location.href = '/login/'
// }

function chitietDatPhong(maphong){
    localStorage.setItem('maphong',maphong)
    window.location.href = "/ThongTinDatPhongChiTiet/index.html";
}

function createResponedDisplay(data){
    //EDIT LIST 
    const divcontainer = document.getElementById("list-row-container")
    
    $.each(data, function(index, cell){
        var date = new Date(cell.NGAYLAP);
        var options = { timeZone: 'Asia/Ho_Chi_Minh' };
        var formattedDate = date.toLocaleString('vi-VN', options);
        cell.NGAYLAP = formattedDate; 
        // console.log(cell.NGAYLAP);
        date = new Date(cell.NGAYDEN);
        formattedDate = date.toLocaleString('vi-VN', options);
        cell.NGAYDEN = formattedDate; 
        date = new Date(cell.NGAYDI);
        formattedDate = date.toLocaleString('vi-VN', options);
        cell.NGAYDI = formattedDate; 
    });

    for(let i = 0; i < data.length; i++){
        
        const divcard = document.createElement("div")
        divcard.setAttribute("id", "list-row")
        const keys = Object.keys(data[i])
        const menuItem = data[i]

        
        
        for (let j = 0; j < keys.length; j++) {
            const content = document.createElement('label')
            content.setAttribute("id", "content")
            content.appendChild(document.createTextNode(menuItem[keys[j]]))
            // console.log(menuItem[keys[j]])
            divcard.appendChild(content)
        }
        //tạo button
        const button = document.createElement('button') 
        button.setAttribute("id", "btn-detail")
        const button_p = document.createElement('p') 
        button_p.appendChild(document.createTextNode('CHI TIẾT'))

        button_p.onclick = function(){ 
            chitietDatPhong(menuItem.MAPHONG)
        }
        button.appendChild(button_p)
        divcard.appendChild(button)
        
        divcontainer.appendChild(divcard)
    }
}



async function DisplayBookingListRoom(){
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

DisplayBookingListRoom()