package com.smhrd.domain;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
    final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    final String JDBC_URL = "jdbc:oracle:thin:@project-db-stu2.smhrd.com:1524:xe";

    public Connection open() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, "suncheon_0713_3", "smhrd3");
    }

    public Date getCreateDate() {
        String SQL = "SELECT sysdate from dual";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getDate(1); // 1을 해서 현재날짜 그대로 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 데이터베이스 오류
    }

    public int getNext() {
        String SQL = "SELECT boardNum FROM BoardDTO ORDER BY boardNum DESC"; // 내림차순하여 가장 마지막에 쓰인 글번호를 가져올 수 있도록 함
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) + 1; // 1을 더해서 그 다음 게시글이 들어갈 수 있도록 함
            }
            return 1; // 현재가 첫번째 게시물인 경우
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int write(String title, String content, String boardFile, String id, String createDate) {
        String SQL = "INSERT INTO BoardDTO (boardNum, title, content, boardFile, id, createDate) " +
                     "VALUES (BoardDTO.nextval, ?, ?, ?, ?, SYSDATE)";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, boardFile);
            pstmt.setString(4, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int getall() {
        String SQL = "SELECT COUNT(boardNum) FROM BoardDTO";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

 // 게시글 리스트
    public ArrayList<BoardDTO> getList() {
        String SQL = "SELECT * FROM BoardDTO ORDER BY boardNum DESC";
        ArrayList<BoardDTO> list = new ArrayList<>();
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
            	BoardDTO BoardDTO = new BoardDTO();
            	BoardDTO.setBoardNum(rs.getInt(1));
            	BoardDTO.setTitle(rs.getString(2));
            	BoardDTO.setContent(rs.getString(3));
            	BoardDTO.setBoardFile(rs.getString(4));
            	BoardDTO.setId(rs.getString(5));
            	BoardDTO.setCreateDate(rs.getDate(6));
            	BoardDTO.setViews(rs.getInt(7));
            	BoardDTO.setLikes(rs.getInt(8));
            	
            	
                list.add(BoardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // 글상세보기 기능
    public BoardDTO getBoardDTO(int boardNum) {
        String SQL = "SELECT * FROM BoardDTO WHERE boardNum = ?";
        BoardDTO BoardDTO = null;
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, boardNum);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                	BoardDTO = new BoardDTO();
                	BoardDTO.setBoardNum(rs.getInt(1));
                	BoardDTO.setTitle(rs.getString(2));
                	BoardDTO.setContent(rs.getString(3));
                	BoardDTO.setBoardFile(rs.getString(4));
                	BoardDTO.setId(rs.getString(5));
                	BoardDTO.setCreateDate(rs.getDate(6));
                	BoardDTO.setViews(rs.getInt(7));
                    int views = rs.getInt(8);
                    BoardDTO.setViews(views);
                    views++;
                    
                    
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return BoardDTO;
    }

    // 글수정하기
    public void update(String title, String boardFile, String content, int boardNum) {
        String SQL = "UPDATE BoardDTO SET title=?, boardFile=?, content=? WHERE boardNum=?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, title);
            pstmt.setString(2, boardFile);
            pstmt.setString(3, content);
            pstmt.setInt(4, boardNum);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 글삭제하기
    public void delete(int boardNum) {
        String SQL = "DELETE FROM BoardDTO WHERE boardNum=?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, boardNum);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	    
	    
    public int updateVIEWS(int boardNum) {
        String incrementViewsSQL = "UPDATE BoardDTO SET views = views + 1 WHERE boardNum = ?";
        String getViewsSQL = "SELECT views FROM BoardDTO WHERE boardNum = ?";
        try (Connection conn = open();
             PreparedStatement incrementPstmt = conn.prepareStatement(incrementViewsSQL);
             PreparedStatement getPstmt = conn.prepareStatement(getViewsSQL)) {
            // 먼저 조회수를 1 증가시킵니다.
            incrementPstmt.setInt(1, boardNum);
            incrementPstmt.executeUpdate();
            
            // 현재 조회수를 가져와서 반환합니다.
            getPstmt.setInt(1, boardNum);
            ResultSet rs = getPstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("views");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int updateLIKES(int boardNum) {
        String SQL = "UPDATE BoardDTO SET likes = likes + 1 WHERE boardNum = ?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, boardNum);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
