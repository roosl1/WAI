<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="EUC-KR">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-store,no-cache">

<title>Insert title here</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  
    function sample3_execDaumPostcode() {
      
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample3_detailAddress").focus();

              
            },
            
        }).open();
    }
</script>

<script>


function goshop() {
	
	document.update.action="goshop";
	document.update.submit();
}

function loginchk() {
		
		var logininfo = ${ sessionScope.loginid };
		
		if (logininfo=="") {
			
			document.update.action="logout";
			document.update.submit();
			
		}
		
}


function logout() {
	
	document.update.action="logout";
	document.update.submit();
	
}

function updatechk() {
	
	if(!update.pw.value){
		alert("��й�ȣ�� �Է����ּ���.");
		return false;
	}
	
	if(!update.pwchk.value){
		alert("��й�ȣ Ȯ�ζ��� ��й�ȣ�� �Է����ּ���.")
		return false;
	}
	
	if(update.pw.value != update.pwchk.value) {
		alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.")
		return false;
	}
	
	if(!update.ad.value){
		alert("�ּҸ� �Է����ּ���.");
		return false;
	}
	
	if(!update.hp1.value || !update.hp2.value || !update.hp3.value){
		alert("����ó�� �Է����ּ���.");
		return false;
	}
	
	if(update.hp1.value.length < 3){
		alert("�ùٸ� �ڵ��� ��ȣ�� �Է����ּ���.")
		return false;
	}
	
	if(update.hp2.value.length < 4){
		alert("�ùٸ� �ڵ��� ��ȣ�� �Է����ּ���.")
		return false;
	}
	
	if(update.hp3.value.length < 4){
		alert("�ùٸ� �ڵ��� ��ȣ�� �Է����ּ���.")
		return false;
	}
	
	if(!update.email.value){
		alert("�̸����� �Է����ּ���.")
		return false;
	}
	
	document.update.action="update";
	document.update.submit();
}

</script>

</head>
<body>


	<h2>�� ���� ����</h2>
	
	<form name="update" method="post" onload="loginchk()">
	


	�̸�	: <input type="text" name="name" value="${mvo.name}" readonly> <br>
	���̵� : <input type="text" name="id" value="${mvo.id }" readonly> <br>
	��й�ȣ : <input type="password" name="pw" value="${mvo.pw }"> <br>
	��й�ȣ Ȯ�� : <input type="password" name="pwchk" value="${mvo.pw }"> <br>
	�ּ� : <br>
	<input type="text" name="ad1" id="sample3_postcode" value="${mvo.ad1 }" placeholder="�����ȣ">
	<input type="button" onclick="sample3_execDaumPostcode()" value="�ּ� ���� �ϱ�"><br>
	<input type="text" name="ad2" id="sample3_address" value="${mvo.ad2 }" placeholder="�ּ�"><br>
	<input type="text" name="ad3" id="sample3_detailAddress" value="${mvo.ad3 }" placeholder="���ּ�"> <br>
	<input type="hidden" id="sample3_extraAddress" placeholder="�����׸�">
	����ó :<input type="text" name="hp1" value="${mvo.hp1}">-<input type="text" name="hp2" value="${mvo.hp2}">-<input type="text" name="hp3" value="${mvo.hp3}"> <br>
	�̸��� : <input type="text" name="email" value="${mvo.email}"> <br>
    
	<input type="button" value="�����ϱ�" onclick="updatechk()">
	<input type="button" value="�α׾ƿ�" onclick="logout()">
	<input type="button" value="�ı� �ۼ�" onclick="review()">
	<input type="button" value="�����Ϸ� ����" onclick="goshop()">
	
	</form>
</body>
</html>