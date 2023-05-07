// pagination
function getPageList(totalPages, page, maxLength) {
    function range(start, end) {
        return Array.from(Array(end - start + 1), (_, i) => i + start);
    }

    var sideWidth = maxLength < 9 ? 1 : 2;
    var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
    var rightWidth = (maxLength - sideWidth * 2 - 3) >> 1;

    if (totalPages <= maxLength) {
        return range(1, totalPages);
    }

    if (page <= maxLength - sideWidth - 1 - rightWidth) {
        return range(1, maxLength - sideWidth - 1).concat(0, range(totalPages - sideWidth + 1, totalPages));
    }

    if (page >= totalPages - sideWidth - 1 - rightWidth) {
        return range(1, sideWidth).concat(0, range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages));
    }

    return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
}
// pagination
function pagination(){
    $(function () {
        var numberOfItems = $(".table-row").length;
        var limitPerPage = 3; //How many card items visible per a page
        var totalPages = Math.ceil(numberOfItems / limitPerPage);
        var paginationSize = 7; //How many page elements visible in the pagination
        var currentPage;
    
        function showPage(whichPage) {
            if (whichPage < 1 || whichPage > totalPages) return false;
    
            currentPage = whichPage;
    
            $(".table-row").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();
    
            $(".p-pagination li").slice(1, -1).remove();
    
            getPageList(totalPages, currentPage, paginationSize).forEach(item => {
                $("<li>").addClass("p-page-item").addClass(item ? "p-current-page" : "p-dots")
                    .toggleClass("p-active", item === currentPage).append($("<a>")
                        .attr({ href: "javascript:void(0)" }).text(item || "...")).insertBefore(".p-next-page");
            });
    
            $(".p-previous-page").toggleClass("p-disable", currentPage === 1);
            $(".p-next-page").toggleClass("p-disable", currentPage === totalPages);
            return true;
        }
    
        $(".p-pagination").append(
            $("<li>").addClass("p-page-item").addClass("p-previous-page").append($("<a>").attr({ href: "javascript:void(0)" }).text("Trước")),
            $("<li>").addClass("p-page-item").addClass("p-next-page").append($("<a>").attr({ href: "javascript:void(0)" }).text("Sau"))
        );
    
        $(".table-row").show();
        showPage(1);
    
        $(document).on("click", ".p-pagination li.p-current-page:not(.p-active)", function () {
            return showPage(+$(this).text());
        });
    
        $(".p-next-page").on("click", function () {
            return showPage(currentPage + 1);
        });
    
        $(".p-previous-page").on("click", function () {
            return showPage(currentPage - 1);
        });
    });
}

function createRows(data) {
    // update widgets
    document.getElementById('numoforders').innerHTML += (' ' + data.length.toString())
    let table = document.getElementsByClassName('responsive-table')[0]
    for(let i = 0; i < data.length; i++){
        let li = document.createElement('li')
        li.className = 'table-row'
        //create column
        let col1 = document.createElement('div') // STT
        col1.className = 'col col-1'
        col1.setAttribute('data-label', 'STT')
        col1.innerHTML = data[i].STT
        
        let col2 = document.createElement('div')// MAKH
        col2.className = 'col col-2'
        col2.setAttribute('data-label','Mã Khách Hàng')
        col2.innerHTML = data[i].MAKH
        
        let col3 = document.createElement('div') //LOAI SP-DV
        col3.className = 'col col-3'
        col3.setAttribute('data-label','Loại SP/DV')
        col3.innerHTML = data[i].LOAIDV_SP
        
        let col4 = document.createElement('div') // Ngày Đặt
        col4.className = 'col col-4'
        col4.setAttribute('data-label','Ngày Đặt')
        col4.innerHTML = data[i].NGAYLAP

        let col5 = document.createElement('div') // Tổng Tiền
        col5.className = 'col col-4'
        col5.setAttribute('data-label','Tổng Tiền')
        col5.innerHTML = (data[i].THANHTIEN.toFixed(2)).toString() + ' VNĐ'

        let bnt1 = document.createElement('button') //Printing Button 
        bnt1.className = 'col col-4'
        bnt1.setAttribute('data-label','Hành Động')
        bnt1.innerHTML = 'In Phiếu'
        bnt1.onclick = async function(){
            let dataCreateBill = {
                mahd : "DH" +  Math.floor(100000 + Math.random() * 900000).toString(),
                mapdk: data[i].MAPDK,
                stt: data[i].STT
            }
            await fetch(url_CreateBill, {
                method: "POST",
                body: JSON.stringify(dataCreateBill),
                headers: {
                    "Content-Type": "application/json",
                },
            }).then((response) =>{
                return response.json()
            }).then((dataCreateBill) =>{
                let result = JSON.stringify(Object.keys(dataCreateBill[0])).substring(2,8)
                if(result === 'RESULT'){
                    localStorage.setItem('printOrderingID',data[i].MAPDK)
                    localStorage.setItem('printOrderingNum',data[i].STT)
                    window.open('./printOrdering.html')
                    location.reload();
                }
                else {
                    alert('Lỗi tạo đơn')
                    location.reload(); 
                }
            })
            
        }
        
        let bnt2 = document.createElement('button') // Deleting Button
        bnt2.className = 'col col-4'
        bnt2.setAttribute('data-label','Hành Động')
        bnt2.innerHTML = 'Xoá Phiếu'
        bnt2.onclick = async function(){
            let dataDeleteOrder = {
                mapdk: data[i].MAPDK,
                stt: data[i].STT
            }
            await fetch(url_DeleteOrder, {
                method: "POST",
                body: JSON.stringify(dataDeleteOrder),
                headers: {
                    "Content-Type": "application/json",
                },
            }).then((response) =>{
                return response.json()
            }).then((dataDeleteOrder) =>{
                let result = JSON.stringify(Object.keys(dataDeleteOrder[0])).substring(2,8)
                if (result === 'RESULT'){
                    alert(dataDeleteOrder[0].RESULT)
                }
                else{
                    alert(dataDeleteOrder[0].ERROR)
                }
                location.reload()
            })
        }

        // add column to li
        li.appendChild(col1)
        li.appendChild(col2)
        li.appendChild(col3)
        li.appendChild(col4)
        li.appendChild(col5)
        li.appendChild(bnt1)
        li.appendChild(bnt2)

        //add li to table
        table.appendChild(li)
    }
}

async function displayTable(){
    await fetch(url_GetSeviceTickets).then((response) =>{
        return response.json()
    }).then((data) =>{
        createRows(data)
        //pagination
        pagination()
    })
}
// ------------MAIN------------
let BASE_URL = readTextFile("../assets/data_local.txt")
let url_GetSeviceTickets = BASE_URL + '/api/getlistservtickets'
let url_CreateBill = BASE_URL + '/api/createbill'
let url_DeleteOrder = BASE_URL + '/api/deleteorder'
displayTable()