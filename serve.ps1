$root = Join-Path $PSScriptRoot 'output'
$l = [System.Net.HttpListener]::new()
$l.Prefixes.Add('http://localhost:5501/')
$l.Start()
Write-Host 'ready on port 5501'
[Console]::Out.Flush()
while ($true) {
  $c = $l.GetContext()
  $req = $c.Request
  $res = $c.Response
  $urlPath = [Uri]::UnescapeDataString($req.Url.LocalPath)
  $localPath = $urlPath.TrimStart('/').Replace('/', '\')
  $p = [System.IO.Path]::Combine($root, $localPath)
  if ([System.IO.File]::Exists($p)) {
    $b = [System.IO.File]::ReadAllBytes($p)
    $ext = [System.IO.Path]::GetExtension($p).ToLower()
    $res.ContentType = if ($ext -eq '.html') { 'text/html; charset=utf-8' }
                       elseif ($ext -eq '.css') { 'text/css' }
                       elseif ($ext -eq '.js') { 'application/javascript' }
                       elseif ($ext -eq '.svg') { 'image/svg+xml' }
                       else { 'application/octet-stream' }
    $res.ContentLength64 = $b.Length
    $res.OutputStream.Write($b, 0, $b.Length)
  } else {
    $res.StatusCode = 404
    $msg = [System.Text.Encoding]::UTF8.GetBytes('not found')
    $res.ContentLength64 = $msg.Length
    $res.OutputStream.Write($msg, 0, $msg.Length)
  }
  $res.Close()
}
