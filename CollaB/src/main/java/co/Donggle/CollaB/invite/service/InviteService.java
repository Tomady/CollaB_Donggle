package co.Donggle.CollaB.invite.service;

public interface InviteService {
	int inviteInsert(InviteVO vo);
	int inviteUpdate(InviteVO vo);
	InviteVO inviteEmailConfirmSelect(InviteVO vo);
}
