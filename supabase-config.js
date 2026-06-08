// ============================================
// SUPABASE CONFIGURATION - Energy Report System
// ============================================
// Project: cvctuowohxagaeprwavl

const SUPABASE_URL = 'https://cvctuowohxagaeprwavl.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2Y3R1b3dvaHhhZ2FlcHJ3YXZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA4OTQ0MjksImV4cCI6MjA5NjQ3MDQyOX0.AEIVcumi7QgjwVmzsJZx6IWleS883r7MNODEFjnnBOs';

// ============================================
// SUPABASE CLIENT INITIALIZATION
// ============================================

import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ============================================
// DATABASE OPERATIONS
// ============================================

// --- WATER DATA ---
async function saveWaterData(data) {
    const { data: result, error } = await supabase
        .from('water_readings')
        .insert([{
            date: data.date,
            shift: data.shift,
            location_code: data.locationCode,
            value: data.value,
            created_at: new Date().toISOString()
        }]);

    if (error) {
        console.error('Error saving water data:', error);
        return { success: false, error };
    }
    return { success: true, data: result };
}

async function getWaterData(date, shift) {
    const { data, error } = await supabase
        .from('water_readings')
        .select('*')
        .eq('date', date)
        .eq('shift', shift);

    if (error) {
        console.error('Error fetching water data:', error);
        return { success: false, error };
    }
    return { success: true, data };
}

// --- ELECTRICITY DATA ---
async function saveElectricData(data) {
    const { data: result, error } = await supabase
        .from('electric_readings')
        .insert([{
            date: data.date,
            shift: data.shift,
            location_code: data.locationCode,
            value: data.value,
            created_at: new Date().toISOString()
        }]);

    if (error) {
        console.error('Error saving electric data:', error);
        return { success: false, error };
    }
    return { success: true, data: result };
}

async function getElectricData(date, shift) {
    const { data, error } = await supabase
        .from('electric_readings')
        .select('*')
        .eq('date', date)
        .eq('shift', shift);

    if (error) {
        console.error('Error fetching electric data:', error);
        return { success: false, error };
    }
    return { success: true, data };
}

// --- GAS DATA ---
async function saveGasData(data) {
    const { data: result, error } = await supabase
        .from('gas_readings')
        .insert([{
            date: data.date,
            shift: data.shift,
            product_line: data.productLine,
            value: data.value,
            created_at: new Date().toISOString()
        }]);

    if (error) {
        console.error('Error saving gas data:', error);
        return { success: false, error };
    }
    return { success: true, data: result };
}

async function getGasData(date, shift) {
    const { data, error } = await supabase
        .from('gas_readings')
        .select('*')
        .eq('date', date)
        .eq('shift', shift);

    if (error) {
        console.error('Error fetching gas data:', error);
        return { success: false, error };
    }
    return { success: true, data };
}

// --- STEAM DATA ---
async function saveSteamData(data) {
    const { data: result, error } = await supabase
        .from('steam_readings')
        .insert([{
            date: data.date,
            shift: data.shift,
            process_step: data.processStep,
            value: data.value,
            created_at: new Date().toISOString()
        }]);

    if (error) {
        console.error('Error saving steam data:', error);
        return { success: false, error };
    }
    return { success: true, data: result };
}

async function getSteamData(date, shift) {
    const { data, error } = await supabase
        .from('steam_readings')
        .select('*')
        .eq('date', date)
        .eq('shift', shift);

    if (error) {
        console.error('Error fetching steam data:', error);
        return { success: false, error };
    }
    return { success: true, data };
}

// --- DASHBOARD STATS ---
async function getDashboardStats(month) {
    const startDate = `${month}-01`;
    const endDate = `${month}-31`;

    // Get totals for each energy type
    const [water, electric, gas, steam] = await Promise.all([
        supabase.from('water_readings').select('value').gte('date', startDate).lte('date', endDate),
        supabase.from('electric_readings').select('value').gte('date', startDate).lte('date', endDate),
        supabase.from('gas_readings').select('value').gte('date', startDate).lte('date', endDate),
        supabase.from('steam_readings').select('value').gte('date', startDate).lte('date', endDate)
    ]);

    const waterTotal = water.data?.reduce((sum, item) => sum + (item.value || 0), 0) || 0;
    const electricTotal = electric.data?.reduce((sum, item) => sum + (item.value || 0), 0) || 0;
    const gasTotal = gas.data?.reduce((sum, item) => sum + (item.value || 0), 0) || 0;
    const steamTotal = steam.data?.reduce((sum, item) => sum + (item.value || 0), 0) || 0;

    return {
        water: waterTotal.toFixed(2),
        electric: electricTotal.toFixed(2),
        gas: gasTotal.toFixed(2),
        steam: steamTotal.toFixed(2)
    };
}

// --- EXPORT DATA ---
async function exportData(fromDate, toDate) {
    const [water, electric, gas, steam] = await Promise.all([
        supabase.from('water_readings').select('*').gte('date', fromDate).lte('date', toDate),
        supabase.from('electric_readings').select('*').gte('date', fromDate).lte('date', toDate),
        supabase.from('gas_readings').select('*').gte('date', fromDate).lte('date', toDate),
        supabase.from('steam_readings').select('*').gte('date', fromDate).lte('date', toDate)
    ]);

    return {
        water: water.data || [],
        electric: electric.data || [],
        gas: gas.data || [],
        steam: steam.data || [],
        exportDate: new Date().toISOString()
    };
}

// --- AUTHENTICATION ---
async function signIn(email, password) {
    const { data, error } = await supabase.auth.signInWithPassword({
        email: email,
        password: password
    });

    if (error) {
        console.error('Sign in error:', error);
        return { success: false, error };
    }
    return { success: true, user: data.user };
}

async function signOut() {
    const { error } = await supabase.auth.signOut();
    if (error) {
        console.error('Sign out error:', error);
        return { success: false, error };
    }
    return { success: true };
}

async function getCurrentUser() {
    const { data: { user } } = await supabase.auth.getUser();
    return user;
}

// Export for use in other files
window.SupabaseDB = {
    supabase,
    saveWaterData,
    getWaterData,
    saveElectricData,
    getElectricData,
    saveGasData,
    getGasData,
    saveSteamData,
    getSteamData,
    getDashboardStats,
    exportData,
    signIn,
    signOut,
    getCurrentUser
};