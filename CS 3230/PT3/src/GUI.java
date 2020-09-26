import	java.awt.*;
import	java.awt.event.*;
import java.beans.EventHandler;

import	javax.swing.*;

public class GUI extends JFrame
{
	public GUI()
	{
		setTitle("GUI");
		setSize(600, 400);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		
		makeMenu();
		
		JButton north = new JButton("North");
		north.addActionListener(new ActionListener() 
		{
			public void actionPerformed(ActionEvent e)
			{
				north();
			}
		});
		Panel northPanel = new Panel();
		northPanel.add(north);
		add(northPanel, BorderLayout.NORTH);
		
		JButton east = new JButton("East");
		east.addActionListener(new ActionListener() 
		{
			public void actionPerformed(ActionEvent e) {
				east();
			}
		});
		Panel eastPanel = new Panel();
		eastPanel.add(east);
		add(eastPanel, BorderLayout.EAST);
		
		JButton south = new JButton("South");
		south.addActionListener(new ActionListener() 
		{
			public void actionPerformed(ActionEvent e)
			{
				south();
			}
		});
		Panel southPanel = new Panel();
		southPanel.add(south);
		add(southPanel, BorderLayout.SOUTH);
		
		JButton west = new JButton("West");
		west.addActionListener(new ActionListener() 
		{
			public void actionPerformed(ActionEvent e)
			{
				west();
			}
		});
		Panel westPanel = new Panel();
		westPanel.add(west);
		add(westPanel, BorderLayout.WEST);
		
		setVisible(true);
	}
	
	class Panel extends JPanel
	{
		public Panel()
		{
			setLayout(new GridBagLayout());
		}
	}
	
	public void north()
	{
		JOptionPane.showMessageDialog(this, "North", "Direction", JOptionPane.INFORMATION_MESSAGE);
	}
	
	public void east()
	{
		JOptionPane.showMessageDialog(this, "East", "Direction", JOptionPane.INFORMATION_MESSAGE);
	}
	
	public void south()
	{
		JOptionPane.showMessageDialog(this, "South", "Direction", JOptionPane.INFORMATION_MESSAGE);
	}
	
	public void west()
	{
		JOptionPane.showMessageDialog(this, "West", "Direction", JOptionPane.INFORMATION_MESSAGE);
	}
	
	private void makeMenu()
	{
		JMenuBar	menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		JMenu compassMenu = makeMenu("Directions", 'D');
		menuBar.add(compassMenu);
		
		compassMenu.add(makeMenuItem("North", "Displays North", "ctrl N", 'N', "north", this));
		compassMenu.add(makeMenuItem("East", "Displays East", "ctrl E", 'E', "east", this));
		compassMenu.add(makeMenuItem("South", "Displays South", "ctrl S", 'S', "south", this));
		compassMenu.add(makeMenuItem("West", "Displays West", "ctrl W", 'W', "west", this));
	}
	
	private JMenuItem makeMenuItem(String label, String tip, String accelerator, char mnemonic, String method, Object target)
	{
		JMenuItem	menuItem = new JMenuItem(label, mnemonic);
		menuItem.setToolTipText(tip);				// adds tool tip text
		menuItem.setAccelerator(KeyStroke.getKeyStroke(accelerator));
		menuItem.addActionListener((ActionListener)EventHandler.create(ActionListener.class,
				target, method));

		return menuItem;
	}
	private JMenu makeMenu(String label, char mnemonic)
	{
		JMenu	menu = new JMenu(label);
		menu.setMnemonic(mnemonic);
		return menu;
	}

	
	public static void main(String[] args)
	{
		new GUI();
	}
}
