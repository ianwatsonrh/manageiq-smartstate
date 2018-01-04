require 'fs/xfs/superblock'

module XFSProbe
  def self.probe(dobj)
    # The first Allocation Group's Superblock is at block zero.
    dobj.seek(0, IO::SEEK_SET)
    XFS::Superblock.new(dobj)

    # If initializing the superblock does not throw any errors, then this is XFS
    $log.debug("XFSProbe << TRUE")
    return true
  rescue => err
    $log.debug "XFSProbe << FALSE because #{err.message}"
    return false
  ensure
    dobj.seek(0, IO::SEEK_SET)
  end
end
