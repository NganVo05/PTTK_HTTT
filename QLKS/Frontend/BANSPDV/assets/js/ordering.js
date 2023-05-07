function checkingBillCode() {
    let billCode = document.getElementById('billCode');
    billCode.addEventListener('input', getCustomerCode)
}

function getCustomerCode(e) {
    let billCode = e.target.value
    if (billCode.length >= 3) {
        const spinner = document.getElementsByClassName("loader"); //loader
        spinner[0].removeAttribute('hidden'); //loader
        setTimeout(async function () {
            let dataRep = {
                mapdk: billCode
            }
            await fetch(url_GetCusCode, {
                method: "POST",
                body: JSON.stringify(dataRep),
                headers: {
                    "Content-Type": "application/json",
                },
            }).then((response) => {
                return response.json()
            }).then((data) => {
                dataCusInfo = data
                document.getElementById('cusCode').value = data[0].MAKH
                loadType()
                spinner[0].setAttribute('hidden', ''); //loader
            })

        }, 500);
    }
    else {
        document.getElementById('cusCode').value = ''
        loadType()
    }
}
async function getForm() {
    let type = document.getElementById('selectType').value
    if(type.substring(0,2) === 'SP'){
        dataCollection['madv'] = 'DVBANSP'
        dataCollection['makg'] = 'KG00'
        dataCollection['masp'] = type
    }else {
        dataCollection['madv'] = type
        dataCollection['makg'] = document.getElementById('startTime').value
        dataCollection['masp'] = null
    }
    dataCollection['mapdk'] = document.getElementById('billCode').value
    dataCollection['makh'] = document.getElementById('cusCode').value
    dataCollection['stt'] = dataCusInfo[0].STT + 1
    dataCollection['thanhtien'] = document.getElementById('totalPrice').value
    dataCollection['soluong'] = document.getElementById('quantity').value
    dataCollection['ghichu'] = document.getElementById('note').value

    await fetch(url_CreateOrder, {
        method: "POST",
        body: JSON.stringify(dataCollection),
        headers: {
            "Content-Type": "application/json",
        },
    }).then((response) => {
        return response.json()
    }).then((data) => {
        let result = JSON.stringify(Object.keys(data[0])).substring(2,8)
        if (result === 'RESULT'){
            alert(data[0].RESULT)
        }
        else{
            alert(data[0].ERROR)
        }
        location.reload()
    })
    
}
function loadType() {
    const spinner = document.getElementsByClassName("loader-select"); //loader
    spinner[0].removeAttribute('hidden'); //loader

    setTimeout(async function () {
        await fetch(url_GetProductList).then((response) => {
            return response.json()
        }).then((data) => {
            let select = document.getElementById('selectType')
            for (let i = 0; i < data[0].length; i++) {
                let option = document.createElement('option')
                option.value = data[0][i].MADV
                option.innerHTML = data[0][i].MADV
                select.appendChild(option)
            }
            for (let i = 0; i < data[1].length; i++) {
                let option = document.createElement('option')
                option.value = data[1][i].MASP
                option.innerHTML = data[1][i].MASP
                select.appendChild(option)
            }
        }).then(() => {
            let selectType = document.getElementById('selectType')
            if (document.getElementById('cusCode').value.length != 0) {
                selectType.removeAttribute('disabled')
                selectType.className = ""
            } else {
                selectType.setAttribute('disabled', '')
                selectType.className = "select--disabled"
            }
            spinner[0].setAttribute('hidden', ''); //loader
        })

    }, 500);
}
async function loadStartTime() {
    let selectType = document.getElementById('selectType')
    let startTime = document.getElementById('startTime')
    let value = selectType.value
    if (value !== '0' && value.substring(0, 2) !== 'SP') {
        if (value !== localStorage.getItem('curentType')) {
            const spinner = document.getElementsByClassName("loader-select"); //loader
            spinner[1].removeAttribute('hidden'); //loader
            setTimeout(async function () {
                let dataRep ={
                    madv : value
                }
                await fetch(url_GetServiceInfo, {
                    method: "POST",
                    body: JSON.stringify(dataRep),
                    headers: {
                        "Content-Type": "application/json",
                    },
                }).then((response) => {
                    return response.json()
                }).then((data) => {
                    dataServiceStore = data;
                    let select = document.getElementById('startTime')
                    for (let i = 0; i < data.length; i++) {
                        let option = document.createElement('option')
                        option.value = data[i].MAKG
                        option.innerHTML = data[i].GIOBD
                        select.appendChild(option)
                    }
                })
                
                startTime.removeAttribute('disabled')
                startTime.className = ""
                spinner[1].setAttribute('hidden', ''); //loader
            }, 1000);
        }
    }
    else {
        startTime.setAttribute('disabled', '')
        startTime.className = "select--disabled"

    }
    if (value.substring(0, 2) === 'SP') {
        document.getElementById('endTime').disabled = true
        let dataRep = {
            masp: value
        }
        await fetch(url_GetProductPrice, {
            method: "POST",
            body: JSON.stringify(dataRep),
            headers: {
                "Content-Type": "application/json",
            },
        }).then((response) => {
            return response.json()
        }).then((data) => {
            let unitPrice = document.getElementById('price')
            const spinner = document.getElementsByClassName("loader"); //loader
            spinner[1].removeAttribute('hidden'); //loader
            setTimeout(function () {
                unitPrice.value = data[0].GIA //parseInt(Math.floor(Math.random() * 10) + 1).toString() + '0000'
                spinner[1].setAttribute('hidden', ''); //loader
            }, 500);
        })
        
    }
    else{
        document.getElementById('endTime').disabled = false; 
    }
    localStorage.setItem('curentType', value)
}

function loadEndTime() {
    let startTime = document.getElementById('startTime')
    let endTime = document.getElementById('endTime')
    let price = document.getElementById('price')
    let value = startTime.value
    if (value !== '0') {
        if (value !== localStorage.getItem('currentStartTime')) {
            const spinner = document.getElementsByClassName("loader"); //loader
            spinner[2].removeAttribute('hidden'); //loader
            endTime
            setTimeout(function () {
                endTime.value = dataServiceStore.find(el => el.MAKG === value).GIOKT
                price.value = dataServiceStore.find(el => el.MAKG === value).GIA
                spinner[2].setAttribute('hidden', ''); //loader
            }, 500);
        }
    }
    else {
        // endTime.setAttribute('disabled', '')
        // endTime.className = "select--disabled"

    }
    localStorage.setItem('currentStartTime', value)

}

function loadUnitPrice() {
    let unitPrice = document.getElementById('price')
    let endTime = document.getElementById('endTime')
    let value = endTime.value
    if (value !== '0') {
        if (value !== localStorage.getItem('currentEndTime')) {
            const spinner = document.getElementsByClassName("loader"); //loader
            spinner[1].removeAttribute('hidden'); //loader
            setTimeout(function () {
                unitPrice.value = parseInt(Math.floor(Math.random() * 10) + 1).toString() + '0000'
                spinner[1].setAttribute('hidden', ''); //loader
            }, 1000);
        }
    }
    else {
        unitPrice.value = ''
    }
    localStorage.setItem('currentEndTime', value)
}

function getQuantity() {
    let quantity = document.getElementById('quantity');
    quantity.addEventListener('input', calTotalPrice)
}

function calTotalPrice(e) {

    let totalPrice = document.getElementById('totalPrice')
    if (e.target.value != 0) {
        totalPrice.value = parseFloat(document.getElementById('price').value) * e.target.value
    }
}
// -----------Main---------------
let dataCollection = {}
let dataServiceStore
let dataCusInfo
let url_GetCusCode = 'http://localhost:5789/api/getcustomercode'
let url_GetProductList = 'http://localhost:5789/api/getproductlist'
let url_GetProductPrice = 'http://localhost:5789/api/getproductprice'
let url_GetServiceInfo = 'http://localhost:5789/api/getsevicedetail'
let url_CreateOrder = 'http://localhost:5789/api/createorder'
checkingBillCode()
getQuantity()
