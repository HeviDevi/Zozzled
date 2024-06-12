const sequelize = require('../config/database');
const Drinks = require('../models/Drinks');
const drinkData = require('./drinkData.json');

const seedDatabase = async () => {
    try {
        console.log('Syncing database...');
        await sequelize.sync({ force: true });
        console.log('Database synced successfully');

        console.log('Seeding database...');
        await Drinks.bulkCreate(drinkData, {
            individualHooks: true,
            returning: true,
        });

        console.log('Database seeded successfully');
    } catch (error) {
        console.error('Error seeding database:', error);
    } finally {
        process.exit(0);
    }
};

seedDatabase();
