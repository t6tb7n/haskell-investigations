module Main (main) where
import Network.Socket
import Network.Socket.ByteString (recv, sendAll)
import Server (serve)

localAddr :: SockAddr
localAddr = SockAddrInet 12345 0x0100007f

main :: IO ()
main = do
    print (serve "Hello World")
    addr <- getAddrInfo (Just defaultHints) (Just "127.0.0.1") (Just "")
    socket <- openSocket (head addr)
    bind socket localAddr
    listen socket 1
    s <- accept socket
    v <- recv (fst s) 1024
    print v
    close (fst s)
    close socket