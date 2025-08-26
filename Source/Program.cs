﻿﻿using System;
using System.Windows.Forms;
using System.Threading;

namespace JeutieControl
{
  internal static class Program
  {
    [STAThread]
    private static void Main()
        {
            bool instanceCountOne = false;
 
            using (Mutex mtex = new Mutex(true, "MyRunningApp", out instanceCountOne))
            {
                if (instanceCountOne)
                {
                    Application.EnableVisualStyles();
                    Application.SetCompatibleTextRenderingDefault(false);
                    Application.Run((Form) new Form1());
                    mtex.ReleaseMutex();
                }
                else
                {
                    MessageBox.Show(
                        "程序实例已在运行！",
                        "Jeutie's 服务器控制面板 - 提示",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information
                    );
                }
            }
        }
  }
}