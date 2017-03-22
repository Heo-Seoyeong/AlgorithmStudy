using System;
using static System.Console;

namespace BinaryTree
{
	public class BinaryTreeNode<T>
	{
		public T Data { get; set; }
		public BinaryTreeNode<T> Left { get; set; }
		public BinaryTreeNode<T> Right { get; set; }
		public BinaryTreeNode(T data)
		{
			this.Data = data;
		}
	}

	public class BinaryTree<T>
	{
		private BinaryTreeNode<T> root = null;
		private Comparer<T> comparer = Comparer<T>.Default;

		public void Insert(T val)
		{
			BinaryTreeNode<T> node = root;
			if (node == null)
			{
				root = new BinaryTreeNode<T>(val);
				return;                
			}

			while(node != null)
			{
				int result = comparer.Compare(node.Data, val);
				if (result == 0)
				{
					return; 
				}
				else if (result > 0)
				{
					if (node.Left == null)
					{
						node.Left = new BinaryTreeNode<T>(val);
						return;                        
					}
					node = node.Left;
				}
				else
				{
					if (node.Right == null)
					{
						node.Right = new BinaryTreeNode<T>(val);
						return;                        
					}
					node = node.Right;
				}
			}
		} 
		// 트리 데이타 출력
		public void Traversal(BinaryTreeNode<T> node)
		{
			if (node == null) return;
			WriteLine(node.Data);
			Traversal(node.Left);
			Traversal(node.Right);
		}
		public void TraversalOrder()
		{
			Traversal (root);
		}
	}

	class MainClass
	{
		public static void Main (string[] args)
		{
			BinaryTree<int> bt = new BinaryTree<int>();
			bt.Insert(4);
			bt.Insert(1);
			bt.Insert(8);
			bt.Insert(9);
			bt.Insert(20);

			bt.TraversalOrder();
		}
	}
}