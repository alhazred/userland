/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
 */

package com.oracle.solaris.vp.panels.usermgr.client.swing;

import javax.swing.*;
import com.oracle.solaris.vp.util.misc.finder.Finder;


/**
 * Implements Groups Settings in Advanced Settings
 */
public class GroupsSettings extends AdvancedSettings {

    private static final String NAME =
    	Finder.getString("usermgr.advanced.groups");
    private static final Icon ICON = Finder.getIcon(
	"images/group-24.png");

    private UserMgrPanelDescriptor panelDesc = null;
    private UserManagedObject userObj = null;
    private GroupsPanel panel = null;

    public GroupsSettings() {
	super(NAME, ICON);
    }

    public void setUser(UserManagedObject userObj) {
	if (panel == null) {
		panel = new GroupsPanel(panelDesc, userObj);
	}
	panel.setUser(userObj);
    }

    public void updateUser() {
	userObj = panel.updateUser();
    }

    public boolean isChanged() {
        if (userObj != null) {
	    return (userObj.getGroupsProperty().isChanged());
	} else {
	    return false;
	}
    }

    public void init(UserMgrPanelDescriptor panelDesc) {
	this.panelDesc = panelDesc;
    }

    public JPanel getPanel() {
    	return panel;
    }
}
