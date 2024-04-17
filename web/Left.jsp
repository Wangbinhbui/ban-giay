<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-filter"></i> Filter</div>
        <div class="card-body">
            <form id="filterForm" action="category" method="GET">
                <div class="form-group">
                    <c:set value="${requestScope.cb}" var="cb"/>
                    <c:set value="${requestScope.cid}" var="cid"/>
                    <c:set value="${requestScope.listC}" var="cat"/>
                    <label>Category:</label>
                    <input type="checkbox" name="cid" id="0" ${cb[0]?"checked":""} value="${0}" onclick="setCheck(this)"/>ALL<br/>
                    <c:forEach begin="0" end="${cat.size()-1}" var="i">
                        <input type="checkbox" name="cid" id="cm" ${cat.get(i).getId()==cid?"checked":""} 
                               value="${cat.get(i).getId()}" ${cb[i+1]?"checked":""} onclick="setCheck(this)"/>${cat.get(i).name}<br/>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <c:set value="${requestScope.bb}" var="bb"/>
                    <c:set value="${requestScope.cid}" var="bid"/>
                    <c:set value="${requestScope.listB}" var="brand"/>
                    <label>Brand:</label>
                    <input type="checkbox" name="bid" id="0" ${bb[0]?"checked":""} value="${0}" onclick="setCheck(this)"/>ALL<br/>
                    <c:forEach begin="0" end="${brand.size()-1}" var="i">
                        <input type="checkbox" name="bid" id="cm" ${brand.get(i).getId()==bid?"checked":""} 
                               value="${brand.get(i).getId()}" ${bb[i+1]?"checked":""} onclick="setCheck(this)"/>${brand.get(i).name}<br/>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <label>Price:</label><br/>
                    <input type="radio" id="increase" name="priceorder" value="increase" ${param.priceorder == 'increase' || empty param.priceorder ? 'checked' : ''}>
                    <label for="increase">increase</label><br>
                    <input type="radio" id="decrease" name="priceorder" value="decrease" ${param.priceorder == 'decrease' ? 'checked' : ''}>
                    <label for="decrease">decrease</label><br>
                </div>
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Lưu trạng thái checkbox category vào localStorage
    function saveCategoryCheckboxState() {
        var checkboxes = document.getElementsByName('cid');
        var checkboxValues = [];
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxValues.push(checkboxes[i].checked);
        }
        localStorage.setItem('categoryCheckboxValues', JSON.stringify(checkboxValues));
    }

    // Khôi phục trạng thái checkbox category từ localStorage
    function restoreCategoryCheckboxState() {
        var storedValues = JSON.parse(localStorage.getItem('categoryCheckboxValues'));
        if (storedValues) {
            var checkboxes = document.getElementsByName('cid');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = storedValues[i];
            }
        }
    }

    // Lưu trạng thái checkbox brand vào localStorage
    function saveBrandCheckboxState() {
        var checkboxes = document.getElementsByName('bid');
        var checkboxValues = [];
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxValues.push(checkboxes[i].checked);
        }
        localStorage.setItem('brandCheckboxValues', JSON.stringify(checkboxValues));
    }

    // Khôi phục trạng thái checkbox brand từ localStorage
    function restoreBrandCheckboxState() {
        var storedValues = JSON.parse(localStorage.getItem('brandCheckboxValues'));
        if (storedValues) {
            var checkboxes = document.getElementsByName('bid');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = storedValues[i];
            }
        }
    }

    // Lưu trạng thái radio button vào localStorage
    function saveRadioState() {
        var selectedPriceOrder = document.querySelector('input[name="priceorder"]:checked').value;
        localStorage.setItem('selectedPriceOrder', selectedPriceOrder);
    }

    // Khôi phục trạng thái radio button từ localStorage
    function restoreRadioState() {
        var selectedPriceOrder = localStorage.getItem('selectedPriceOrder');
        if (selectedPriceOrder) {
            document.getElementById(selectedPriceOrder).checked = true;
        }
    }

    // Hàm xử lý khi checkbox được chọn
    function setCheck(obj) {
        var fries = document.getElementsByName('cid');
        if (obj.id === '0' && (fries[0].checked === true)){
            for (var i = 1; i < fries.length; i++){
                fries[i].checked = false;
            }
        } else {
            for (var i = 1; i < fries.length; i++){
                if (fries[i].checked === true){ 
                    fries[0].checked = false;
                    break;
                }
            }
        }
        var fries1 = document.getElementsByName('bid');
        if (obj.id === '0' && (fries1[0].checked === true)){
            for (var i = 1; i < fries1.length; i++){
                fries1[i].checked = false;
            }
        } else {
            for (var i = 1; i < fries1.length; i++){
                if (fries1[i].checked === true){ 
                    fries1[0].checked = false;
                    break;
                }
            }
        }

        // Cập nhật trạng thái checkbox category
        if (obj.name === 'cid') {
            saveCategoryCheckboxState();
        }
        // Cập nhật trạng thái checkbox brand
        else if (obj.name === 'bid') {
            saveBrandCheckboxState();
        }

        // Cập nhật trạng thái radio button
        saveRadioState();
    }

    // Gọi hàm khôi phục trạng thái checkbox và radio button khi trang được tải lại
    window.onload = function() {
        restoreCategoryCheckboxState();
        restoreBrandCheckboxState();
        restoreRadioState();
    };
</script>

