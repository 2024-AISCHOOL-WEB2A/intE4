package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.WCLProject.model.DTO.Dress;

public class DressDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	// 드레스 목록 조회 시 페이징을 적용한 메서드
    public List<Dress> getDressesByFiltersWithPaging(List<String> fabrics, List<String> lines, List<String> styles, String priceRange, String region, int page, int pageSize) {
        List<Dress> dresses = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM (SELECT D.*, ROWNUM AS RNUM FROM (SELECT * FROM DRESS WHERE 1=1");
        
        // fabric 필터 SQL 쿼리
        if (fabrics != null && !fabrics.isEmpty()) {
            sql.append(" AND DRESS_FABRIC IN (");
            for (int i = 0; i < fabrics.size(); i++) {
                sql.append("?");
                if (i < fabrics.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (lines != null && !lines.isEmpty()) {
            sql.append(" AND DRESS_LINE IN (");
            for (int i = 0; i < lines.size(); i++) {
                sql.append("?");
                if (i < lines.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (styles != null && !styles.isEmpty()) {
            sql.append(" AND DRESS_STYLE IN (");
            for (int i = 0; i < styles.size(); i++) {
                sql.append("?");
                if (i < styles.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "베이직":
                    sql.append(" AND DRESS_PRICE < 700000");
                    break;
                case "스탠다드":
                    sql.append(" AND DRESS_PRICE >= 700000 AND DRESS_PRICE < 1500000");
                    break;
                case "프리미엄":
                    sql.append(" AND DRESS_PRICE >= 1500000");
                    break;
            }
        }

        if (region != null && !region.isEmpty()) {
            sql.append(" AND VENDOR_ID IN (SELECT VENDOR_ID FROM VENDOR WHERE VENDOR_ADDRESS LIKE ?)");
        }
        
        // 페이징을 위한 ROWNUM 쿼리
        sql.append(" ORDER BY DRESS_ID) D WHERE ROWNUM <= ?) WHERE RNUM >= ?");

        try {
            conn = DBUtil.getConnection();
            pst = conn.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (fabrics != null && !fabrics.isEmpty()) {
                for (String fabric : fabrics) {
                    pst.setString(paramIndex++, fabric);
                }
            }

            if (lines != null && !lines.isEmpty()) {
                for (String line : lines) {
                    pst.setString(paramIndex++, line);
                }
            }

            if (styles != null && !styles.isEmpty()) {
                for (String style : styles) {
                    pst.setString(paramIndex++, style);
                }
            }

            if (region != null && !region.isEmpty()) {
                pst.setString(paramIndex++, "%" + region + "%");
            }

            pst.setInt(paramIndex++, page * pageSize);
            pst.setInt(paramIndex, (page - 1) * pageSize + 1);

            rs = pst.executeQuery();

            while (rs.next()) {
                Dress dress = new Dress();
                dress.setId(rs.getString("DRESS_ID"));
                dress.setDressBrand(rs.getString("DRESS_BRAND"));
                dress.setDressFabric(rs.getString("DRESS_FABRIC"));
                dress.setDressLine(rs.getString("DRESS_LINE"));
                dress.setDressStyle(rs.getString("DRESS_STYLE"));
                dress.setDressPrice(rs.getInt("DRESS_PRICE"));
                dress.setDressContent(rs.getString("DRESS_CONTENT"));
                dress.setDressDate(rs.getTimestamp("DRESS_DATE"));
                dress.setVendorId(rs.getString("VENDOR_ID"));
                dress.setPhotoPath(rs.getString("PHOTO_PATH"));
                dress.setDressTitle(rs.getString("DRESS_TITLE"));
                dresses.add(dress);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        return dresses;
    }

    // 필터링된 드레스의 총 개수를 가져오는 메서드
    public int getFilteredDressCount(List<String> fabrics, List<String> lines, List<String> styles, String priceRange, String region) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM DRESS WHERE 1=1");

        if (fabrics != null && !fabrics.isEmpty()) {
            sql.append(" AND DRESS_FABRIC IN (");
            for (int i = 0; i < fabrics.size(); i++) {
                sql.append("?");
                if (i < fabrics.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (lines != null && !lines.isEmpty()) {
            sql.append(" AND DRESS_LINE IN (");
            for (int i = 0; i < lines.size(); i++) {
                sql.append("?");
                if (i < lines.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (styles != null && !styles.isEmpty()) {
            sql.append(" AND DRESS_STYLE IN (");
            for (int i = 0; i < styles.size(); i++) {
                sql.append("?");
                if (i < styles.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "베이직":
                    sql.append(" AND DRESS_PRICE < 700000");
                    break;
                case "스탠다드":
                    sql.append(" AND DRESS_PRICE >= 700000 AND DRESS_PRICE < 1500000");
                    break;
                case "프리미엄":
                    sql.append(" AND DRESS_PRICE >= 1500000");
                    break;
            }
        }

        if (region != null && !region.isEmpty()) {
            sql.append(" AND VENDOR_ID IN (SELECT VENDOR_ID FROM VENDOR WHERE VENDOR_ADDRESS LIKE ?)");
        }

        try {
            conn = DBUtil.getConnection();
            pst = conn.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (fabrics != null && !fabrics.isEmpty()) {
                for (String fabric : fabrics) {
                    pst.setString(paramIndex++, fabric);
                }
            }

            if (lines != null && !lines.isEmpty()) {
                for (String line : lines) {
                    pst.setString(paramIndex++, line);
                }
            }

            if (styles != null && !styles.isEmpty()) {
                for (String style : styles) {
                    pst.setString(paramIndex++, style);
                }
            }

            if (region != null && !region.isEmpty()) {
                pst.setString(paramIndex++, "%" + region + "%");
            }

            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        return count;
    }
    
    // 페이지 단위로 드레스 목록을 가져오는 메서드(중복 페이징 추후 수정 예정)
    public List<Dress> getDresses(int currentPage, int pageSize) {
        List<Dress> dresses = new ArrayList<>();
        // page : 현재 페이지 번호, pageSize : 한 페이지에 표시할 개수
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            // 내부 서브쿼리 : 컬럼 선택하여 DRESS_ID로 정렬(컬럼을 하나만 빼도 출력이 안되는 오류가 발생했음)
            // 중간 서브쿼리 ROWNUM 각 행의 고유 번호를 매김
            String sql = "SELECT * FROM (SELECT DRESS.*, ROWNUM AS RNUM FROM (SELECT * FROM DRESS ORDER BY DRESS_ID) DRESS WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, endRow);
            pst.setInt(2, startRow);
            rs = pst.executeQuery();

            while (rs.next()) {
                Dress dress = new Dress();
                dress.setId(rs.getString("DRESS_ID"));
                dress.setDressBrand(rs.getString("DRESS_BRAND"));
                dress.setDressFabric(rs.getString("DRESS_FABRIC"));
                dress.setDressLine(rs.getString("DRESS_LINE"));
                dress.setDressStyle(rs.getString("DRESS_STYLE"));
                dress.setDressPrice(rs.getInt("DRESS_PRICE"));
                dress.setDressContent(rs.getString("DRESS_CONTENT"));
                dress.setDressDate(rs.getTimestamp("DRESS_DATE"));
                dress.setVendorId(rs.getString("VENDOR_ID"));
                dress.setPhotoPath(rs.getString("PHOTO_PATH"));
                dress.setDressTitle(rs.getString("DRESS_TITLE"));
                dresses.add(dress);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        return dresses;
    }

	// 특정 ID의 드레스를 가져오는 메서드
	// 드레스 ID로 드레스 상세정보 페이지를 출력하기 위해 사용
	public Dress getDressById(String dressId) {
		Dress dress = null;
		String sql = "SELECT * FROM DRESS WHERE DRESS_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dressId);
			rs = pst.executeQuery();
			// 불필요한 부분은 수정 예정
			if (rs.next()) {
				dress = new Dress();
				dress.setId(rs.getString("DRESS_ID"));
				dress.setDressBrand(rs.getString("DRESS_BRAND"));
				dress.setDressFabric(rs.getString("DRESS_FABRIC"));
				dress.setDressLine(rs.getString("DRESS_LINE"));
				dress.setDressStyle(rs.getString("DRESS_STYLE"));
				dress.setDressPrice(rs.getInt("DRESS_PRICE"));
				dress.setDressContent(rs.getString("DRESS_CONTENT"));
				dress.setDressDate(rs.getTimestamp("DRESS_DATE"));
				dress.setVendorId(rs.getString("VENDOR_ID"));
				dress.setPhotoPath(rs.getString("PHOTO_PATH"));
				dress.setDressTitle(rs.getString("DRESS_TITLE"));
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return dress;
	}

	// 특정 브랜드의 드레스를 가져오는 메서드
	// 상세페이지에서 해당 브랜드가 가지고 있는 드레스들을 모두 출력하기 위해 사용
	public List<Dress> getDressesByBrand(String brand) {
		List<Dress> dresses = new ArrayList<>();
		String sql = "SELECT * FROM DRESS WHERE DRESS_BRAND = ?";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);

			pst.setString(1, brand);
			rs = pst.executeQuery();

			while (rs.next()) {
				Dress dress = new Dress();
				dress.setId(rs.getString("DRESS_ID"));
				dress.setDressBrand(rs.getString("DRESS_BRAND"));
				dress.setPhotoPath(rs.getString("PHOTO_PATH"));
				dresses.add(dress);

			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}
		return dresses;
	}

	// 드레스 상품 ID 생성
	public String generateDressId() {
		String id = null;
		String sql = "SELECT COALESCE('DRESS' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(DRESS_ID, 6))) + 1, 1), 5, '0'), 'DRESS00001') AS DRESS_ID FROM DRESS WHERE REGEXP_LIKE(SUBSTR(DRESS_ID, 6), '^[0-9]+$')";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				id = rs.getString("DRESS_ID");
				System.out.println("Generated ID: " + id);
			} else {
				System.out.println("No data returned from query.");
			}
		} catch (SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.err.println("Class Not Found Error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return id;
	}

	// 드레스 상품 등록
	public int addDress(Dress dress) {
		int cnt = 0;
		String sql = "INSERT INTO DRESS(DRESS_ID, DRESS_BRAND, DRESS_FABRIC, DRESS_LINE, DRESS_STYLE, DRESS_PRICE, DRESS_CONTENT, DRESS_DATE, VENDOR_ID, PHOTO_PATH, DRESS_TITLE) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dress.getId());
			pst.setString(2, dress.getDressBrand());
			pst.setString(3, dress.getDressFabric());
			pst.setString(4, dress.getDressLine());
			pst.setString(5, dress.getDressStyle());
			pst.setInt(6, dress.getDressPrice());
			pst.setString(7, dress.getDressContent());
			pst.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			pst.setString(9, dress.getVendorId());
			pst.setString(10, dress.getPhotoPath());
			pst.setString(11, dress.getDressTitle());

			cnt = pst.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return cnt;
	}

}