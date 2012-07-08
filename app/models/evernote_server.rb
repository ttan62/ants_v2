class EvernoteServer < Evernote::EDAM::NoteStore::NoteStore::Client
  def initialize(authToken)
    @auth = authToken
    evernoteHost = "sandbox.evernote.com"
    userStoreUrl = "https://#{evernoteHost}/edam/user"

    userStoreTransport = Thrift::HTTPClientTransport.new(userStoreUrl)
    userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)
    userStore = Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)

    versionOK = userStore.checkVersion("Sciants Beta (Ruby)", Evernote::EDAM::UserStore::EDAM_VERSION_MAJOR, Evernote::EDAM::UserStore::EDAM_VERSION_MINOR)

    noteStoreUrl = userStore.getNoteStoreUrl(@auth)

    noteStoreTransport = Thrift::HTTPClientTransport.new(noteStoreUrl)
    noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
    super(noteStoreProtocol)
  end

  def listNotebooks
    super(@auth)
  end
end