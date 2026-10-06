package com.lastminuteslotbooking.service;

import java.util.List;
import com.lastminuteslotbooking.dao.ClaimDAO;
import com.lastminuteslotbooking.dao.SlotDAO;
import com.lastminuteslotbooking.daoimpl.ClaimDAOImpl;
import com.lastminuteslotbooking.daoimpl.SlotDAOImpl;
import com.lastminuteslotbooking.model.Claim;
import com.lastminuteslotbooking.model.Slot;

public class ClaimService {
    private final ClaimDAO claimDAO = new ClaimDAOImpl();
    private final SlotDAO slotDAO = new SlotDAOImpl();

    public boolean claimSlot(Claim claim) {
        if (claim == null || claim.getUserId() <= 0 || claim.getSlotId() <= 0) return false;
        Slot slot = slotDAO.getSlotById(claim.getSlotId());
        if (slot == null || !slot.isAvailable() || claimDAO.isSlotAlreadyClaimed(claim.getUserId(), claim.getSlotId())) return false;
        claim.setStatus("CLAIMED");
        boolean claimed = claimDAO.claimSlot(claim);
        if (claimed) slotDAO.updateAvailability(claim.getSlotId(), false);
        return claimed;
    }

    public boolean cancelClaim(int claimId) {
        if (claimId <= 0) return false;
        Claim claim = claimDAO.getClaimById(claimId);
        if (claim == null || !"CLAIMED".equalsIgnoreCase(claim.getStatus())) return false;
        boolean cancelled = claimDAO.cancelClaim(claimId);
        if (cancelled) slotDAO.updateAvailability(claim.getSlotId(), true);
        return cancelled;
    }

    public List<Claim> getClaimsByUserId(int userId) { return userId > 0 ? claimDAO.getClaimsByUserId(userId) : List.of(); }
    public List<Claim> getAllClaims() { return claimDAO.getAllClaims(); }
    public Claim getClaimById(int claimId) { return claimId > 0 ? claimDAO.getClaimById(claimId) : null; }
}
