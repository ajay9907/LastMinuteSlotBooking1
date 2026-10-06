package com.lastminuteslotbooking.dao;

import java.util.List;
import com.lastminuteslotbooking.model.Claim;

public interface ClaimDAO {
    boolean claimSlot(Claim claim);
    boolean cancelClaim(int claimId);
    List<Claim> getClaimsByUserId(int userId);
    List<Claim> getAllClaims();
    Claim getClaimById(int claimId);
    boolean isSlotAlreadyClaimed(int userId, int slotId);
}
