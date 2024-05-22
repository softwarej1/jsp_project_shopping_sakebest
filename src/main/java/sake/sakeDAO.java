package sake;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBClose;
import common.DBSet;

public class sakeDAO {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    
    //-------------------------------------- 결제 시 리뷰 추가
 public int payIns(String user_id, String no, String quantity ) {
    	
    	String sql = "insert into sake_review(review_name, review_no, review_date, review_quantity) values(?, ?, sysdate, ?)";
    	int su = 0;
    	
    	try {
    		conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, no);
			pstmt.setString(3, quantity);
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return su;
    }
    
    //-------------------------------- 리뷰 정보 Select --------------------------------
 public ArrayList<reviewDTO> reveiwSelect(String user_id, int no) {
	ArrayList<reviewDTO> reviewArrDTO = new ArrayList<reviewDTO>();
 	reviewDTO dto = null;
 	String sql = "";
 	if(no == 0) {
 		sql = "SELECT * FROM sake_review WHERE review_name =?";
 	}else {
 		sql = "SELECT * FROM sake_review WHERE review_no =?";
 	}
     
     try {
         conn = DBSet.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user_id);
         rs = pstmt.executeQuery();
         
         if (rs != null) {
             while (rs.next()) {
             	 String review_name = rs.getString("review_name");
             	 String review_no = rs.getString("review_no");
                 String review_star = rs.getString("review_star");
                 String review_date = rs.getString("review_date");
                 String review_title = rs.getString("review_title");
                 String review_content = rs.getString("review_content");
                 String review_quantity = rs.getString("review_quantity");
                 String review_photo = rs.getString("review_photo");
                 
                 dto = new reviewDTO(review_name, review_no, review_star, review_date, review_title, review_content, review_quantity, review_photo);
                 reviewArrDTO.add(dto);
             }
         }
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         DBClose.close(conn, pstmt, rs);
     }
     return reviewArrDTO;
 }
    
    //---------------------------------------- 리뷰 추가
    public int reviewIns(reviewDTO dto) {
    	
    	String sql = "INSERT INTO sake_review VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    	int su = 0;
    	
    	try {
    		conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReview_name());
			pstmt.setString(2, dto.getReview_no());
			pstmt.setString(3, dto.getReview_star());
			pstmt.setString(4, dto.getReview_date());
			pstmt.setString(5, dto.getReview_title());
			pstmt.setString(6, dto.getReview_content());
			pstmt.setString(7, dto.getReview_quantity());
			pstmt.setString(8, dto.getReview_photo());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return su;
    }
    
    //---------------------------------------- 리뷰 삭제
    public int reviewDel(String user_id, String review_no) {
    	
    	String sql = "DELETE FROM sake_review WHERE review_name=? AND review_no=?";
    	int su = 0;
    	
    	try {
    		conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, review_no);

			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return su;
    }
    
    //---------------------------------------- 리뷰 업데이트
    public int reviewUpd(reviewDTO dto) {

    	String sql = "UPDATE sake_review SET review_star=?, review_title=?, review_content=?"
    			+ "WHERE review_name=? AND review_no=?";
    	int su = 0;
    	
    	try {
    		conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReview_star());
			pstmt.setString(2, dto.getReview_title());
			pstmt.setString(3, dto.getReview_content());
			pstmt.setString(4, dto.getReview_name());
			pstmt.setString(5, dto.getReview_no());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return su;
    }
    
    //--------------------------------------------------------------------------------

    public sakeDTO sakeSelect(String sake_no) {
        sakeDTO dto = null;
        String sql = "select * from sake_table where sake_no =?";
        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sake_no);
            rs = pstmt.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    sake_no = rs.getString("sake_no");
                    String sake_name = rs.getString("sake_name");
                    String sake_name_kr = rs.getString("sake_name_kr");
                    String sake_co = rs.getString("sake_co");
                    String sake_loc = rs.getString("sake_loc");
                    String sake_dosu = rs.getString("sake_dosu");
                    String sake_des = rs.getString("sake_des");
                    String sake_img = rs.getString("sake_img");
                    int sake_price = rs.getInt("sake_price");
                    dto = new sakeDTO(sake_no, sake_name, sake_name_kr, sake_co, sake_loc, sake_dosu, sake_des, sake_img, sake_price);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    public boolean userLog(userDTO dto) {
        String sql = "select * from sake_user where user_id = ? and user_pwd = ?";
        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getUser_id());
            pstmt.setString(2, dto.getUser_pwd());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return false;
    }

    public String cartList(String vid) {
        String cartList = "";
        try {
            String sql = "select user_cart from sake_user where user_id =?";

            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                cartList = rs.getString("user_cart");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cartList;
    }

    // 상세설명창 메소드
    public sakeDTO sakeProSelect(String sake_no) {
        sakeDTO dto = null;
        String sql = "select * from sake_table where sake_no =?";
        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sake_no);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    sake_no = rs.getString("sake_no");
                    String sake_name = rs.getString("sake_name");
                    String sake_name_kr = rs.getString("sake_name_kr");
                    String sake_co = rs.getString("sake_co");
                    String sake_loc = rs.getString("sake_loc");
                    String sake_dosu = rs.getString("sake_dosu");
                    String sake_des = rs.getString("sake_des");
                    String sake_img = rs.getString("sake_img");
                    int sake_price = rs.getInt("sake_price");
                    dto = new sakeDTO(sake_no, sake_name, sake_name_kr, sake_co, sake_loc, sake_dosu, sake_des, sake_img, sake_price);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 카트DB전송 메소드
    public int sendCart(String user_cart, String user_id) {
        String sql01 = "select user_cart from sake_user where user_id =?";
        String cart = "";
        int su = 0;
        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql01);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cart = rs.getString("user_cart");
                if (cart == null) {
                    String sql02 = "UPDATE sake_user SET user_cart = ? WHERE user_id = ?";
                    pstmt = conn.prepareStatement(sql02);
                    pstmt.setString(1, user_cart);
                    pstmt.setString(2, user_id);
                    su = pstmt.executeUpdate();
            }  else {
                String sql03 = "UPDATE sake_user SET user_cart = ? WHERE user_id = ?";
                String add_cart = cart + user_cart;
                pstmt = conn.prepareStatement(sql03);
                pstmt.setString(1, add_cart);
                pstmt.setString(2, user_id);
                su = pstmt.executeUpdate();
            }
          }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return su;
    }
    
    // 회원가입 부분
    public int inputUser(userDTO dto) {
    	
    	String sql = "insert into sake_user values(?, ?, ?, ?, ?, ?, ?, ?)";
    	int su = 0;
    	
    	try {
    		conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_birth());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_addr());
			pstmt.setString(7, dto.getUser_cart());
			pstmt.setString(8, dto.getUser_favorite());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return su;
    }
    
    public userDTO userPage(String vid) {
        userDTO uDTO = null;
        try {
            String sql = "select * from sake_user where user_id =?";
            String vId, vPwd, vName, vPhone, vAddr, vBirth, vCart, vFavorite;

            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vid);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                vId = vid;
                vPwd = rs.getString("user_pwd");
                vName = rs.getString("user_name");
                vBirth = rs.getString("user_birth");
                vPhone = rs.getString("user_phone");
                vAddr = rs.getString("user_addr");
                vCart = rs.getString("user_cart");
                vFavorite = rs.getString("user_favorite");

                uDTO = new userDTO(vId, vPwd, vName, vBirth, vPhone, vAddr, vCart, vFavorite);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return uDTO;
    }
    
  //전체적인 흐름: DB의 장바구니 목록과 user가 삭제할 장바구니 목록을 비교하여
    //서로 같은 상품이 있으면 새로 업데이트 할 장바구니 목록에 추가하지 않음
    //서로 다른 상품일 경우 새로 업데이트 할 장바구니 목록에 추가됨
    //결국 user가 삭제할 상품은 새로 업데이트 할 장바구니 목록에 담겨지지 않은 채 업데이트
    public int delCart(String user_cart, String user_id) {
        String sql01 = "select user_cart from sake_user where user_id = ?";
        String cart = ""; // DB에서 가져온 장바구니 값을 저장할 변수
        String cart_value = "";//삭제 후 남은 장바구니 값을 저장할 변수
        String[] split_cart = user_cart.split(",");
        //user_cart: 삭제할 상품 목록 / ","로 잘라 배열에 저장(1-sake01의 형태)
        int su = 0;

        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql01);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cart = rs.getString("user_cart");
                String[] cartAry = cart.split(",");//삭제할 장바구니 값을 ","로 잘라 배열에 저장(1-sake01의 형태)

                for (int outerIdx = 0; outerIdx < cartAry.length; outerIdx++) {
                    boolean toDelete = false;
                    for (int innerIdx = 0; innerIdx < split_cart.length; innerIdx++) {
                        if (cartAry[outerIdx].equals(split_cart[innerIdx])) {
                        	//삭제할 품목과 DB목록의 품목이 같으면 밑의 if문의 cart_value에 추가하지 않고 지나감
                            toDelete = true;
                            break;
                        }
                    }
                    if (!toDelete) {
                        cart_value += cartAry[outerIdx] + ",";
                    }
                }

                // 맨 끝 쉼표 제거
                if (cart_value.length() > 0 && cart_value.charAt(cart_value.length() - 1) == ',') {
                    cart_value = cart_value.substring(0, cart_value.length() - 1);
                }

                String sql02 = "UPDATE sake_user SET user_cart = ? WHERE user_id = ?";//위의 삭제 후 남은 장바구니 업데이트
                pstmt = conn.prepareStatement(sql02);
                pstmt.setString(1, cart_value);
                pstmt.setString(2, user_id);
                su = pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return su;
    }
    
    public int user_info_update(String id, String pwd, String name, String birth, String phone, String addr) {
    	int su = 0;
    	try {
			String sql = "update sake_user set user_pwd=?, user_name=?, user_birth=?, user_phone=?, user_addr=? where user_id=?";
			conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, birth);
			pstmt.setString(4, phone);
			pstmt.setString(5, addr);
			pstmt.setString(6, id);
			su = pstmt.executeUpdate();
			} catch (SQLException e) {
			// TODO: handle exception
		}finally {
			DBClose.close(conn, pstmt);
		}
    	return su;
    }
    
    
    //id찾기
    public int recovery_id(String name, String birth, String phone, userDTO dto) {
    	int su =0;
    	try {
    		String sql = "Select * from sake_user where user_name =? and user_birth=? and user_phone=?";
			conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_id(rs.getString("user_id"));
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
    	
    	return su;
    }
    
    
    //비밀번호 찾기
    public int recovery_pwd(String id, String name, String birth, String phone, userDTO dto) {
    	int su =0;
    	try {
    		String sql = "Select * from sake_user where user_id=? and user_name =? and user_birth=? and user_phone=?";
    		conn = DBSet.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.setString(2, name);
    		pstmt.setString(3, birth);
    		pstmt.setString(4, phone);
    		rs = pstmt.executeQuery(); 
    		
    		if (rs.next()) {
    			dto.setUser_id(rs.getString("user_id"));
    		}
    	} catch (SQLException e) {
    		// TODO: handle exception
    	}finally {
    		DBClose.close(conn, pstmt, rs);
    	}
    	
    	return su;
    }
    
    //비밀번호 변경
    public int reset_pwd(String id, String pwd) {
    	int su =0;
    	try {
    		String sql="update sake_user set user_pwd=? where user_id=?";
			conn = DBSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			su = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBClose.close(conn, pstmt);
		}
    	return su;
    }
    
    //상품 검색 알고리즘
    public ArrayList<sakeDTO> sake_search(String search) {
        String sql = "select * from sake_table where sake_name LIKE ?";
        ArrayList<sakeDTO> searchList = new ArrayList<sakeDTO>();
        try {
            conn = DBSet.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%"+search +"%");
            rs = pstmt.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    String sake_no = rs.getString("sake_no");
                    String sake_name = rs.getString("sake_name");
                    String sake_name_kr = rs.getString("sake_name_kr");
                    String sake_co = rs.getString("sake_co");
                    String sake_loc = rs.getString("sake_loc");
                    String sake_dosu = rs.getString("sake_dosu");
                    String sake_des = rs.getString("sake_des");
                    String sake_img = rs.getString("sake_img");
                    int sake_price = rs.getInt("sake_price");
                    sakeDTO dto = new sakeDTO(sake_no, sake_name, sake_name_kr, sake_co, sake_loc, sake_dosu, sake_des, sake_img, sake_price);
                    searchList.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return searchList;
    }
    
}





