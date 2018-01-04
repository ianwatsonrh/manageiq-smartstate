module HFSProbe
  HFS_SUPER_OFFSET  = 0
  HFS_MAGIC_OFFSET  = 0
  HFS_MAGIC_SIZE    = 2
  HFS_SUPER_MAGIC   = 0x4c4b

  def self.probe(dobj)
    # Check for HFS signature in first int.
    dobj.seek(HFS_SUPER_OFFSET + HFS_MAGIC_OFFSET)
    bs = dobj.read(HFS_MAGIC_SIZE)&.unpack('S')
    magic = bs.nil? ? nil : bs[0]
    raise "HFS is Not Supported" if magic == HFS_SUPER_MAGIC

    # No HFS.
    false
  end
end
