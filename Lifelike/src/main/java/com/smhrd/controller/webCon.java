package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.BoardDAO;
import com.smhrd.domain.BoardDTO;

public class webCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        BoardDAO BoardDAO = new BoardDAO();

        if ("list".equals(action)) {
            ArrayList< BoardDTO> boardList = BoardDAO.getList();
            
            request.setAttribute("boardList", boardList);
            request.getRequestDispatcher("boardList.jsp").forward(request, response); // 여기서 "list.jsp"를 "board.jsp"로 변경
        } else if ("view".equals(action)) {
            int boardNum = Integer.parseInt(request.getParameter("boardNum"));
            BoardDTO board = BoardDAO.getBoardDTO(boardNum);
            
            // 글 보기 로직
            request.setAttribute("board", board);
            request.getRequestDispatcher("boardDetail.jsp").forward(request, response);
        } else if ("like".equals(action)) {
            int boardNum = Integer.parseInt(request.getParameter("boardNum"));
            BoardDAO.updateLIKES(boardNum);
            
            // 좋아요 로직
            response.sendRedirect("BoardDTO?action=board"); // 좋아요 후 목록으로 이동
        } else {
            response.sendRedirect("boardList.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        BoardDAO BoardDAO = new BoardDAO();

        if ("write".equals(action)) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String boardFile = request.getParameter("boardFile");
            String id = request.getParameter("id");
            String createDate = request.getParameter("createDate");

            int result = BoardDAO.write(title, content, boardFile, id, createDate);
            if (result > 0) {
                response.sendRedirect("boardDetail.jsp");
            } else {
                response.sendRedirect("boardList.jsp");
            }
        } else if ("update".equals(action)) {
            int boardNum = Integer.parseInt(request.getParameter("boardNum"));
            String title = request.getParameter("title");
            String boardFile = request.getParameter("boardFile");
            String content = request.getParameter("content");

            BoardDAO.update(title, boardFile, content, boardNum);
            response.sendRedirect("BoardDTO?action=view&boardNum=" + boardNum);
        } else if ("delete".equals(action)) {
            int boardNum = Integer.parseInt(request.getParameter("boardNum"));

            BoardDAO.delete(boardNum);
            response.sendRedirect("boardList.jsp");
        } else {
            response.sendRedirect("boardDetail.jsp");
        }
		
	}

}
