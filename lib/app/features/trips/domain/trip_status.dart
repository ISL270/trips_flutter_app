import 'package:flutter/material.dart';

/// Trip status enum with display properties
enum TripStatus {
  proposalSent('Proposal Sent', Color(0xFFFFC268)),
  pendingApproval('Pending Approval', Color(0xFFC25F30)),
  readyForTravel('Ready for Travel', Color(0xFF33BFED));

  final String label;
  final Color color;

  const TripStatus(this.label, this.color);

  static TripStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'proposal sent':
        return TripStatus.proposalSent;
      case 'pending approval':
        return TripStatus.pendingApproval;
      case 'ready for travel':
        return TripStatus.readyForTravel;
      default:
        return TripStatus.proposalSent;
    }
  }
}
