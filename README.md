# Blockchain-Based Urban Traffic Optimization System

A comprehensive smart contract system built on the Stacks blockchain using Clarity to optimize urban traffic flow through real-time data collection, analysis, and automated traffic signal coordination.

## 🚦 System Overview

This system leverages blockchain technology to create a transparent, decentralized traffic management solution that can:

- **Verify and manage traffic intersections**
- **Track vehicle flow patterns in real-time**
- **Coordinate traffic signal timing**
- **Predict traffic congestion**
- **Analyze system performance and improvements**

## 📋 Smart Contracts

### 1. Intersection Verification Contract (`intersection-verification.clar`)
Manages the registration, verification, and status tracking of traffic intersections.

**Key Features:**
- Register new intersections with location and traffic light count
- Verify intersection operational status
- Track maintenance requirements
- Monitor intersection health

**Main Functions:**
- `register-intersection` - Add new intersection to the system
- `verify-intersection` - Mark intersection as verified and operational
- `update-status` - Update operational and maintenance status

### 2. Vehicle Flow Contract (`vehicle-flow.clar`)
Records and analyzes traffic flow patterns across intersections.

**Key Features:**
- Real-time vehicle count tracking
- Speed monitoring
- Direction and vehicle type classification
- Hourly traffic statistics

**Main Functions:**
- `record-flow` - Log vehicle flow data
- `update-hourly-stats` - Aggregate hourly traffic statistics
- `get-flow-data` - Retrieve historical flow information

### 3. Signal Coordination Contract (`signal-coordination.clar`)
Optimizes traffic light timing and coordinates signal phases across multiple intersections.

**Key Features:**
- Dynamic signal timing adjustment
- Multi-intersection coordination groups
- Traffic-responsive optimization
- Offset calculation for signal progression

**Main Functions:**
- `set-signal-timing` - Configure green, yellow, red durations
- `create-coordination-group` - Link intersections for coordinated timing
- `optimize-timing` - Adjust timing based on traffic density

### 4. Congestion Prediction Contract (`congestion-prediction.clar`)
Forecasts traffic bottlenecks and provides early warning systems.

**Key Features:**
- Machine learning-based congestion prediction
- Traffic pattern analysis
- Bottleneck alert system
- Alternative route recommendations

**Main Functions:**
- `predict-congestion` - Generate congestion forecasts
- `set-traffic-pattern` - Define peak hour patterns
- `create-bottleneck-alert` - Issue traffic alerts

### 5. Performance Analytics Contract (`performance-analytics.clar`)
Tracks system performance metrics and measures improvement over time.

**Key Features:**
- Key Performance Indicator (KPI) tracking
- Before/after optimization comparisons
- System-wide performance metrics
- Improvement trend analysis

**Main Functions:**
- `record-performance-metric` - Log performance data
- `create-kpi` - Define system KPIs
- `record-optimization-result` - Track optimization outcomes

## 🛠 Installation & Setup

### Prerequisites
- Stacks blockchain development environment
- Clarity CLI tools
- Node.js (for testing)

### Quick Start

1. **Clone the repository:**
   \`\`\`bash
   git clone <repository-url>
   cd traffic-optimization-system
   \`\`\`

2. **Install dependencies:**
   \`\`\`bash
   npm install
   \`\`\`

3. **Run tests:**
   \`\`\`bash
   npm test
   \`\`\`

4. **Deploy contracts:**
   \`\`\`bash
# Deploy to testnet
clarinet deployments generate --devnet
clarinet deployments apply --devnet
\`\`\`

## 🧪 Testing

The system includes comprehensive test suites for all contracts using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test intersection-verification
npm test vehicle-flow
npm test signal-coordination
npm test congestion-prediction
npm test performance-analytics
\`\`\`

### Test Coverage
- ✅ Contract function validation
- ✅ Error handling scenarios
- ✅ Data integrity checks
- ✅ State management verification
- ✅ Integration testing

## 📊 Usage Examples

### Registering an Intersection
\`\`\`clarity
(contract-call? .intersection-verification register-intersection "Main St & Oak Ave" u4)
\`\`\`

### Recording Traffic Flow
\`\`\`clarity
(contract-call? .vehicle-flow record-flow u1 u25 u45 "north" "sedan")
\`\`\`

### Setting Signal Timing
\`\`\`clarity
(contract-call? .signal-coordination set-signal-timing u1 u60 u5 u30)
\`\`\`

### Creating Congestion Prediction
\`\`\`clarity
(contract-call? .congestion-prediction predict-congestion u1 u8 u75 u85 "heavy morning traffic")
\`\`\`

## 🔧 Configuration

### Environment Variables
- `STACKS_NETWORK` - Target network (testnet/mainnet)
- `CONTRACT_OWNER` - Contract deployment address
- `API_ENDPOINT` - Stacks API endpoint

### Contract Parameters
Each contract includes configurable parameters for:
- Error codes and messages
- Data validation thresholds
- Performance targets
- Alert severity levels

## 📈 Performance Metrics

The system tracks key performance indicators including:

| Metric | Description | Target |
|--------|-------------|---------|
| Average Wait Time | Time vehicles spend at intersections | < 45 seconds |
| Throughput | Vehicles per hour per intersection | > 800 vph |
| Congestion Reduction | Decrease in traffic bottlenecks | 20% improvement |
| Signal Optimization | Timing adjustment effectiveness | 15% efficiency gain |
| System Uptime | Operational availability | 99.5% |

## 🛡 Security Considerations

- **Access Control**: Contract functions protected by owner-only modifiers
- **Data Validation**: Input sanitization and boundary checks
- **State Integrity**: Atomic operations and consistent state management
- **Error Handling**: Comprehensive error codes and graceful failures

## 🚀 Future Enhancements

- Integration with IoT traffic sensors
- Real-time weather impact analysis
- Machine learning model integration
- Mobile app for traffic alerts
- Integration with GPS navigation systems

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: \`git checkout -b feature/new-feature\`
3. Commit changes: \`git commit -am 'Add new feature'\`
4. Push to branch: \`git push origin feature/new-feature\`
5. Submit a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For technical support or questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

---

**Built with ❤️ for smarter cities and efficient transportation**
