package com.example.sayno

import android.accessibilityservice.AccessibilityService
import android.view.accessibility.AccessibilityEvent

class SayNoAccessibilityService : AccessibilityService() {
    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        // Phase 2A only registers the service. No content inspection is performed.
    }

    override fun onInterrupt() {
        // No active work to interrupt in Phase 2A.
    }
}
