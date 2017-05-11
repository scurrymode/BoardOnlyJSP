//��������� �Խù��� ��Ͻ��״� �۾��� �������α׷� ������� �غ���~!

package app.gui;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import board.model.Board;
import board.model.BoardDAO;

public class RegistWin extends JFrame{
	JTextField t_writer, t_title;
	JTextArea area;
	JButton bt;
	
	

	public RegistWin() {
		t_writer = new JTextField(20);
		t_title = new JTextField(20);
		area = new JTextArea(10, 20);
		bt= new JButton("���");
		
		setLayout(new FlowLayout());
		
		add(t_writer);
		add(t_title);
		add(area);
		add(bt);
		
		bt.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				regist();			
			}
		});
		
		setSize(300,350);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	
	}
	
	public void regist(){
		String title = t_title.getText();
		String writer = t_writer.getText();
		String content = area.getText();
	
		//DAO�� �̿�����!
		BoardDAO dao = new BoardDAO();
		Board dto = new Board();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContent(content);
		
		int result = dao.insert(dto);
		
		if(result!=0){
			JOptionPane.showMessageDialog(this, "�����մϴ�. �����߾��!");
		}
		
	}
	

	public static void main(String[] args) {
		new RegistWin();

	}

}
