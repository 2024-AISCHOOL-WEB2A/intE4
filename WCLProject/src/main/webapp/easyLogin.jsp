<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:kakaoLogin();"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPUAAADOCAMAAADR0rQ5AAAAwFBMVEX////+5QAaGhwAAB3+4wD/8H3/6AD/+tP+5w3/5wD/6gD/7QCllREABBz/7gD23QBaUxeYiRQOEBzKtgrVwAgXFxwrKhl2bBYqKBoPERzhywWunQ/FsgupmQ6bjBAkIxrx2QDgygY7NxlCPRhnXhb//N7//ef/85n/6i//8Yj/+MP/9q3/+cv+6Tr/9KT//eofHxs0MRl+cxK4pg+MfhVeVRZTTRdLRhg2MxlAPBdsYxOHexJ4bhL/7mf/61n/60ki/TTxAAADv0lEQVR4nO3aCXObRhyH4az+eKtdLrGgC5AEsmI7SZ1KRhaN7bbf/1t1kRzdttPOmCP5PTM+NJgZXu9yDh8+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/HSurm+Y8a5Y+9PHqiuPfL5lJWh/qbrzwO9lNBe+Vl2656qUkV67qrp152tp0eyi6tad8oaa3f5RdexWedGsXZ/jeJnVv1Udu4VqVKMa1ahG9c9QzaXpaKYUv061NAJrtWjNF7NRyvgvUu34M0XDrqZo0g/N/WXircGXL0+POlcL945Ut/Wsa9N4b2ESpq9H8ywLXsquczV7oNa+rr3LltFi4r5abSpaygZWLw+jdTZl3zukRfR6tezfR82rFuGwe1TdGubJttreq+ZSSLn9lUu5/mQUfye5/mJH+fWtlidDralYnqmWwWg5ztxikUwtzxuNRpYrIyvgMrN8IxovR8nBLl7farOjTqtpzM9UL+dkE+WBHtNxixYToiElzpw8aa5o+o202cHuUN9qJx+eVtuP4qRaRkSWn11S7vKQ7HEY9mkVGGavqO6o+VOW6fNfKBpRfX6srZMZLpI/yXOkTG3KnIhsyaVP01A8V1PfkWYwIZ83olp6P7Zfi5CGgU5yv+nKmGzXdDLSR71ttcl4MGhKtUh6J8dwtTLYcbUu7RXVxoxmjOVqcvegiilxXC0bUc2EdXq+9uW56sG6+p4emBmpgVLTUbGHNHKs9XY/0sFoD1W03fR1tXie4ar4Z7hTGsuQBizRs9sUja1mhjXv7g30IttteVGdGK7Gkkvq68sSn7qxTKl7mef56jERDZ3hmhPbxRgPlbKp5yV7G66vSFXnvtPpzEKZET1F3pyeJHOeaGPFGzvWRVurq3Ldtozdg1tLPdZ6xmuTgItoqi9SBktXGN78IdHuFBnmoqi+31T3mlTtrJRtW3o3NeXRlbQI4w1fH9NkEmdxKplIFQX61O1ENjHux6ngQVzcbiZ+nOyvXe9qQ19KpudvnITc4N8/8OJkd0lTK4vuWuTx4j6Ebb4VPw5WrnW1PimNjf/03CjI13v1JHr9LrTW1Sw5fGj0Nm4aYZC65ks31o2oZv/jwajgb69U8+p3guqKoRrVqEY1qlHdrOp2edU39XnL7q/yqv+uunWntBelmVGnV6Uvyqq+rbr0wD/lRN/U6PXwwvXN+ze3L+rzmvSzj5+vL97Vpy/1OWkBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8kH8BsKdY7sd+d6AAAAAASUVORK5CYII="></a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	// Initialize the Kakao SDK
	window.Kakao.init("ca86f087f3c4b3dacde14170e15c6291");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope: 'profile_nickname, account_email',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: function(res) {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
			},
			fail: function(error) {
				console.error(error);
			}
		});
	}
</script>
</body>
</html>